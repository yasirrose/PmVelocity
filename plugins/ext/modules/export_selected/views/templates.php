<?php
/**
 * Этот файл является частью программы "CRM Руководитель" - конструктор CRM систем для бизнеса
 * https://www.rukovoditel.net.ru/
 * 
 * CRM Руководитель - это свободное программное обеспечение, 
 * распространяемое на условиях GNU GPLv3 https://www.gnu.org/licenses/gpl-3.0.html
 * 
 * Автор и правообладатель программы: Харчишина Ольга Александровна (RU), Харчишин Сергей Васильевич (RU).
 * Государственная регистрация программы для ЭВМ: 2023664624
 * https://fips.ru/EGD/3b18c104-1db7-4f2d-83fb-2d38e1474ca3
 */
?>

<h3 class="page-title"><?php echo TEXT_EXT_EXPORT_SELECTED ?></h3>

<p><?php echo TEXT_EXT_EXPORT_SELECTED_INFO ?></p>

<?php
$where_sql = '';

if($export_templates_filter > 0)
{
    $where_sql .= " and ep.entities_id='" . db_input($export_templates_filter) . "'";
}

$templates_query = db_query("select ep.*, e.name as entities_name from app_ext_export_selected ep, app_entities e where e.id=ep.entities_id " . $where_sql . " order by e.id, ep.sort_order, ep.name");
?>  


<div class="row">
    <div class="col-md-9">
        <?php echo button_tag(TEXT_BUTTON_CREATE, url_for('ext/export_selected/form'), true) ?>
        <?php if(db_num_rows($templates_query) > 1 and $export_templates_filter > 0) echo button_tag(TEXT_SORT_ORDER, url_for('ext/export_selected/sort'), true, array('class' => 'btn btn-default')) ?>
    </div>
    <div class="col-md-3">
        <?php echo form_tag('templates_filter', url_for('ext/export_selected/templates', 'action=set_export_templates_filter')) ?>
        <?php echo select_tag('export_templates_filter', entities::get_choices_with_empty(), $export_templates_filter, array('class' => 'form-control input-large float-right', 'onChange' => 'this.form.submit()')) ?>
        </form>
    </div>
</div>  

<div class="table-scrollable">
    <table class="table table-striped table-bordered table-hover">
        <thead>
            <tr>
                <th><?php echo TEXT_ACTION ?></th>        
                <th><?php echo TEXT_REPORT_ENTITY ?></th>
                <th><?php echo TEXT_TYPE ?></th>
                <th width="100%"><?php echo TEXT_NAME ?></th>    
                <th><?php echo TEXT_ACCESS ?></th>    
                <th><?php echo TEXT_IS_ACTIVE ?></th>
                <th><?php echo TEXT_SORT_ORDER ?></th>    
            </tr>
        </thead>
        <tbody>
            <?php
            if(db_num_rows($templates_query) == 0)
                echo '<tr><td colspan="6">' . TEXT_NO_RECORDS_FOUND . '</td></tr>';

            $access_groups_cache = access_groups::get_cache();

            while($templates = db_fetch_array($templates_query)):
                ?>
                <tr>
                    <td style="white-space: nowrap;"><?php
                        echo button_icon_delete(url_for('ext/export_selected/delete_confirm', 'id=' . $templates['id'])) . ' ' .
                        button_icon_edit(url_for('ext/export_selected/form', 'id=' . $templates['id'])) . ' ' .
                        button_icon(TEXT_COPY, 'fa fa-files-o', url_for('ext/export_selected/templates', 'action=copy&templates_id=' . $templates['id']), false, ['onClick' => 'return confirm("' . addslashes(TEXT_COPY_RECORD) . '?")'])
                        ?></td>
                    <td><?php echo $templates['entities_name'] ?></td>
                    <td><?php echo $templates['type'] ?></td>
                    <td><?php
                    
                        
                        $export_fields = [];
                        
                        if(in_array($templates['type'], ['docx']))
                        {
                            $html = link_to($templates['name'], url_for('ext/export_selected/table_blocks', 'templates_id=' . $templates['id']));
                            
                            $html .= '<br><small>' . TEXT_FILENAME . ':';

                            if(is_file(DIR_WS_TEMPLATES . $templates['filename']))
                            {
                                $html .= ' <a href="' . DIR_WS_TEMPLATES . $templates['filename'] . '">' . $templates['filename'] . '</a>';
                            }
                            else
                            {
                                $html .= ' <span class="color-danger">' . TEXT_FILE_NOT_FOUND . '</span>';
                            }

                            $html .= '</small>';
                                                        
                            $blocks_query = db_query("select b.*, f.name, f.entities_id, f.type as field_type,f.configuration as field_configuration from app_ext_export_selected_blocks b, app_fields f, app_entities e where  block_type='body_cell' and b.fields_id=f.id and b.templates_id = " . $templates['id'] . " and b.parent_id=0  and f.entities_id=e.id order by b.sort_order, b.id",false);
                            while($blocks = db_fetch_array($blocks_query))
                            {
                                $export_fields[] = fields_types::get_option($blocks['field_type'], 'name',$blocks['name']);    
                            }                                                         
                        }
                        
                        if(in_array($templates['type'], ['xlsx','csv','txt']))
                        {
                            $html = $templates['name'];
                            
                            if(strlen($templates['export_fields']))
                            {                               
                                foreach(explode(',',$templates['export_fields']) as $field_id)
                                {
                                    if(isset($app_fields_cache[$templates['entities_id']][$field_id]))
                                    {
                                        $export_fields[] = fields::get_name_by_id($field_id);
                                    }
                                }                               
                            }
                        }
                        
                        if(in_array($templates['type'], ['xlsx']) and strlen($templates['filename']))
                        {
                            $html .= '<br><small>' . TEXT_FILENAME . ':';

                            if(is_file(DIR_WS_TEMPLATES . $templates['filename']))
                            {
                                $html .= ' <a href="' . DIR_WS_TEMPLATES . $templates['filename'] . '">' . $templates['filename'] . '</a>';
                            }
                            else
                            {
                                $html .= ' <span class="color-danger">' . TEXT_FILE_NOT_FOUND . '</span>';
                            }

                            $html .= '</small>';
                        }
                        
                        if(count($export_fields))
                        {
                            $html .= '<br>' . tooltip_text(TEXT_FIELDS . ': ' . implode(', ', $export_fields));
                        }

                        echo $html;


                        
                        ?></td>  
                    <td>
                        <?php
                        if(strlen($templates['users_groups']) > 0)
                        {
                            $users_groups = array();
                            foreach(explode(',', $templates['users_groups']) as $id)
                            {
                                $users_groups[] = $access_groups_cache[$id];
                            }

                            if(count($users_groups) > 0)
                            {
                                echo '<span style="display:block" data-html="true" data-toggle="tooltip" data-placement="left" title="' . addslashes(implode(', ', $users_groups)) . '">' . TEXT_USERS_GROUPS . ' (' . count($users_groups) . ')</span>';
                            }
                        }

                        if($templates['assigned_to'] > 0)
                        {
                            $assigned_to = array();
                            foreach(explode(',', $templates['assigned_to']) as $id)
                            {
                                $assigned_to[] = $app_users_cache[$id]['name'];
                            }

                            if(count($assigned_to) > 0)
                            {
                                echo '<span data-html="true" data-toggle="tooltip" data-placement="left" title="' . addslashes(implode(', ', $assigned_to)) . '">' . TEXT_USERS_LIST . ' (' . count($assigned_to) . ')</span>';
                            }
                        }
                        ?>  
                    </td>
                    <td><?php echo render_bool_value($templates['is_active']) ?></td>
                    <td><?php echo $templates['sort_order'] ?></td>    
                </tr>  
<?php endwhile ?>
        </tbody>
    </table>
</div>