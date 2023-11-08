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

class xml_export
{

    public $templates_id, $items_to_export, $filename;

    function __construct($templates_id, $items_to_export = false)
    {
        $this->templates_id = $templates_id;
        $this->items_to_export = ($items_to_export ? (is_array($items_to_export) ? $items_to_export : [$items_to_export]) : false);
        $this->filename = false;
    }

    function export()
    {
        $templates_query = db_query("select * from app_ext_xml_export_templates where id='" . $this->templates_id . "'");
        if(!$templates = db_fetch_array($templates_query))
            return false;
                

        if($templates['entities_id'] > 0)
        {
            $this->export_single($templates);
        }
        else
        {
            $this->export_group($templates);
        }
    }

    function export_group($template)
    {
        global $sql_query_having;
        
        header("Content-Type: text/xml");
        
        //start xml output
        echo '<?xml version="1.0" encoding="UTF-8" ?>' . "\n" . $this->prepare_php_code($template['template_header']) . "\n";
        
        $templates_query = db_query("select * from app_ext_xml_export_templates where id in (" . db_input_in($template['template_body']). ")");
        while($templates = db_fetch_array($templates_query))
        {
            
            $listing_sql_query = '';
            $listing_sql_query_select = '';
            $listing_sql_query_having = '';
            $sql_query_having = array();

            $reports_info_query = db_query("select id from app_reports where entities_id='" . db_input($templates['entities_id']) . "' and reports_type='xml_export" . $templates['id'] . "'");
            if($reports_info = db_fetch_array($reports_info_query))
            {
                $listing_sql_query = reports::add_filters_query($reports_info['id'], $listing_sql_query);

                //prepare having query for formula fields
                if(isset($sql_query_having[$templates['entities_id']]))
                {
                    $listing_sql_query_having = reports::prepare_filters_having_query($sql_query_having[$templates['entities_id']]);
                }

                $listing_sql_query .= $listing_sql_query_having;
            }

            //prepare forumulas query
            $listing_sql_query_select = fieldtype_formula::prepare_query_select($templates['entities_id'], $listing_sql_query_select);

            $items_query = db_query("select e.* " . $listing_sql_query_select . " from app_entity_" . $templates['entities_id'] . " e where e.id>0 " . $listing_sql_query, false);
            while($items = db_fetch_array($items_query))
            {
                $pattern = new fieldtype_text_pattern;
                $xml = $pattern->output_singe_text($templates['template_body'], $templates['entities_id'], $items, ['is_xml' => 1]);

                $xml = $this->prepare_php_code($xml, $items);

                $xml = $this->prepare_attachments($xml, $templates, $items);
                
                $xml = $this->prepare_linked_entities($xml, $templates, $items);

                echo $xml . "\n";
            }
        }
        
        echo $this->prepare_php_code($template['template_footer']);
        
    }

    function export_single($templates)
    {
        global $sql_query_having;

        //save as file
        if($this->filename)
        {
            header("Content-Type: text/xml");
            header("Content-disposition: attachment; filename=" . $this->filename . ".xml");
            header("Pragma: no-cache");
            header("Expires: 0");
        }
        else
        {
            header("Content-Type: text/xml");
        }

        //start xml output
        echo '<?xml version="1.0" encoding="UTF-8" ?>' . "\n" . $this->prepare_php_code($templates['template_header']) . "\n";

        $listing_sql_query = '';
        $listing_sql_query_select = '';
        $listing_sql_query_having = '';
        $sql_query_having = array();

        $reports_info_query = db_query("select id from app_reports where entities_id='" . db_input($templates['entities_id']) . "' and reports_type='xml_export" . $templates['id'] . "'");
        if($reports_info = db_fetch_array($reports_info_query))
        {
            $listing_sql_query = reports::add_filters_query($reports_info['id'], $listing_sql_query);

            //prepare having query for formula fields
            if(isset($sql_query_having[$templates['entities_id']]))
            {
                $listing_sql_query_having = reports::prepare_filters_having_query($sql_query_having[$templates['entities_id']]);
            }

            $listing_sql_query .= $listing_sql_query_having;
        }

        //prepare forumulas query
        $listing_sql_query_select = fieldtype_formula::prepare_query_select($templates['entities_id'], $listing_sql_query_select);

        $items_query = db_query("select e.* " . $listing_sql_query_select . " from app_entity_" . $templates['entities_id'] . " e where e.id>0 " . ($this->items_to_export ? " and id in (" . implode(',', $this->items_to_export) . ")" : "") . $listing_sql_query, false);
        while($items = db_fetch_array($items_query))
        {
            $pattern = new fieldtype_text_pattern;
            $xml = $pattern->output_singe_text($templates['template_body'], $templates['entities_id'], $items, ['is_xml' => 1]);

            $xml = $this->prepare_php_code($xml, $items);

            $xml = $this->prepare_attachments($xml, $templates, $items);
            
            $xml = $this->prepare_linked_entities($xml, $templates, $items);

            echo $xml . "\n";
        }

        //end xml output
        echo $this->prepare_php_code($templates['template_footer']);
    }
    
    function prepare_linked_entities($xml, $templates,  $item)
    {
        preg_match_all("/\[entity_(\d+)\]/",$xml,$matches);
                        
        foreach($matches[1] as $entity_id)
        {
            if(isset_entity($entity_id))
            {
                $xml = $this->prepare_nested_entities($xml, $templates, $entity_id,$item['id']);
            }
        }
        
        preg_match_all("/\[field_(\d+)\]/",$xml,$matches);
        
        foreach($matches[1] as $field_id)
        {            
            $field_query = db_query("select * from app_fields where id={$field_id}");
            if($field = db_fetch_array($field_query))
            {                
                $cfg = new settings($field['configuration']);
                
                if($field['type']=='fieldtype_related_records')
                {         
                    $related_records = new related_records($field['entities_id'],$item['id']);
                    $related_records->set_related_field($field['id']);
                    $related_items = $related_records->get_related_items();
                    
                    if(count($related_items))                    
                    {                        
                        $xml = $this->prepare_related_entities($xml,$templates,$field['id'],$cfg->get('entity_id'),$related_items);
                    }
                    else
                    {
                        $xml = str_replace('[field_' . $field_id . ']', '', $xml);
                    }
                }
                else
                {
                    $entity_id = (in_array($field['type'],['fieldtype_users','fieldtype_users_ajax']) ? 1 : $cfg->get('entity_id'));
                    
                    if(isset($item['field_' . $field['id']]) and strlen($item['field_' . $field['id']]))
                    {
                        $related_items  = explode(',',$item['field_' . $field['id']]);
                        $xml = $this->prepare_related_entities($xml,$templates,$field['id'],$entity_id,$related_items);
                    }
                    else
                    {
                        $xml = str_replace('[field_' . $field_id . ']', '', $xml);
                    }
                }
            }
            
        }
        
        return $xml;
    }
    
    function prepare_related_entities($xml, $templates,  $field_id, $entity_id, $related_items)
    {
        $related_entities = new settings($templates['related_entities_template']);
        
        $template_body = $related_entities->get('field_' . $field_id);
        
        $query = new items_query($entity_id,[ 
                'where' => "and e.id in (" . db_input_in(implode(',',$related_items)) . ")",
                'fields_in_query' => $template_body,                
                'add_formula' => true,                        
            ]);
        
        $xml_items = [];
        $items_query = db_query($query->get_sql(),false);
        while($items = db_fetch_array($items_query))
        {
            $pattern = new fieldtype_text_pattern;
            $text = $pattern->output_singe_text($template_body, $entity_id, $items, ['is_xml' => 1]);

            $text = $this->prepare_php_code($text, $items);

            $text = $this->prepare_attachments($text, $templates, $items);
            
            $xml_items[] = $text;
        }
        //print_rr($xml_items);
        
        $xml = str_replace('[field_' . $field_id . ']', implode("\n",$xml_items), $xml);
        
        return $xml;
    }
    
    function prepare_nested_entities($xml, $templates,  $entity_id, $parent_item_id)
    {
        $related_entities = new settings($templates['related_entities_template']);
        
        $template_body = $related_entities->get('entity_' . $entity_id);
        
        $query = new items_query($entity_id,[ 
                'where' => "and e.parent_item_id=" . $parent_item_id,
                'fields_in_query' => $template_body,                
                'add_formula' => true,                        
            ]);
        
        $xml_items = [];
        $items_query = db_query($query->get_sql());
        while($items = db_fetch_array($items_query))
        {
            $pattern = new fieldtype_text_pattern;
            $text = $pattern->output_singe_text($template_body, $entity_id, $items, ['is_xml' => 1]);

            $text = $this->prepare_php_code($text, $items);

            $text = $this->prepare_attachments($text, $templates, $items);
            
            $xml_items[] = $text;
        }
        //print_rr($xml_items);
        $xml = str_replace('[entity_' . $entity_id . ']', implode("\n",$xml_items), $xml);
        
        return $xml;
    }

    function prepare_php_code($xml, $item = [])
    {

        if(preg_match_all('/<\?php(.*?)\?>/si', $xml, $matches))
        {
            foreach($matches[1] as $matches_key => $php_code)
            {
                $php_code = '
                        $value = call_user_func(function($item) { 
                            ' . $php_code . '
                         },$item);
                         '; //
                //echo $php_code;

                try
                {
                    eval($php_code);
                }
                catch(Error $e)
                {
                    $value = $php_code . "\n***" . TEXT_ERROR . ' ' . $e->getMessage() . ' on line ' . $e->getLine() . '***';
                }

                $xml = str_replace($matches[0][$matches_key], $value, $xml);
            }
        }

        return $xml;
    }

    function prepare_attachments($xml, $templates, $items)
    {
        global $app_fields_cache;

        if(preg_match_all('/{#(\w+):[^}]*}/', $xml, $matches))
        {
            //print_rr($matches);

            foreach($matches[1] as $matches_key => $fields_id)
            {
                $pattern = explode(':', $matches[0][$matches_key]);
                $pattern = trim(substr($pattern[1], 0, -1));

                $value_to_replace = '';

                if(in_array($app_fields_cache[$templates['entities_id']][$fields_id]['type'], ['fieldtype_attachments', 'fieldtype_image', 'fieldtype_image_ajax', 'fieldtype_input_file']) and strlen($items['field_' . $fields_id]))
                {
                    foreach(explode(',', $items['field_' . $fields_id]) as $file)
                    {
                        $url = htmlspecialchars(url_for('export/file', 'id=' . $fields_id . '&path=' . $templates['entities_id'] . '-' . $items['id'] . '&file=' . urlencode($file)), ENT_XML1);
                        $value_to_replace .= str_replace($fields_id . '_value', $url, $pattern) . "\n";
                    }

                    //echo $value_to_replace;
                }
                elseif(in_array($app_fields_cache[$templates['entities_id']][$fields_id]['type'], ['fieldtype_dropdown_multiple', 'fieldtype_entity', 'fieldtype_entity_ajax', 'fieldtype_users', 'fieldtype_users_ajax', 'fieldtype_tags', 'fieldtype_checkboxes']) and strlen($items['field_' . $fields_id]))
                {
                    foreach(explode(',', $items['field_' . $fields_id]) as $value_id)
                    {
                        $output_options = array('class' => $app_fields_cache[$templates['entities_id']][$fields_id]['type'],
                            'value' => $value_id,
                            'field' => $app_fields_cache[$templates['entities_id']][$fields_id],
                            'item' => $items,
                            'is_export' => true,
                            'is_print' => true,
                            'path' => $templates['entities_id']);

                        $value_to_replace .= str_replace($fields_id . '_value', fields_types::output($output_options), $pattern) . "\n";
                    }
                }
                elseif(in_array($app_fields_cache[$templates['entities_id']][$fields_id]['type'], ['fieldtype_input_date', 'fieldtype_input_datetime', 'fieldtype_dynamic_date']) and strlen($items['field_' . $fields_id]) and $items['field_' . $fields_id] > 0)
                {
                    $value_to_replace = date($pattern, $items['field_' . $fields_id]);
                }

                $xml = str_replace($matches[0][$matches_key], $value_to_replace, $xml);
            }
        }

        return $xml;
    }

    static function get_position_choices()
    {
        $choices = array();
        $choices['default'] = TEXT_DEFAULT;
        $choices['menu_more_actions'] = TEXT_EXT_MENU_MORE_ACTIONS;
        $choices['menu_with_selected'] = TEXT_EXT_MENU_WITH_SELECTED;
        $choices['menu_export'] = TEXT_EXT_EXPORT_BUTTON;

        return $choices;
    }

    static function get_users_templates_by_position($entities_id, $position, $url_params = '')
    {
        global $app_user;

        $templates_list = array();

        $html = '';

        $templates_query = db_query("select ep.* from app_ext_xml_export_templates ep, app_entities e where ep.is_active=1 and e.id=ep.entities_id and find_in_set('" . str_replace('_dashboard', '', $position) . "',ep.button_position) and ep.entities_id='" . db_input($entities_id) . "' and (find_in_set(" . $app_user['group_id'] . ",users_groups) or find_in_set(" . $app_user['id'] . ",assigned_to)) order by ep.sort_order, ep.name");
        while($templates = db_fetch_array($templates_query))
        {
            if(!in_array($position, ['menu_with_selected', 'menu_with_selected_dashboard']))
            {
                if(!self::check_buttons_filters($templates))
                {
                    continue;
                }
            }


            $button_title = (strlen($templates['button_title']) ? $templates['button_title'] : $templates['name']);
            $button_icon = (strlen($templates['button_icon']) ? $templates['button_icon'] : 'fa-file-code-o');

            $style = (strlen($templates['button_color']) ? 'color: ' . $templates['button_color'] : '');

            switch($position)
            {
                case 'default':
                    $html .= '<li>' . button_tag($button_title, url_for('items/xml_export', 'path=' . $_GET['path'] . '&templates_id=' . $templates['id']), true, array('class' => 'btn btn-primary btn-sm btn-template-' . $templates['id']), $button_icon) . '</li>';
                    $html .= self::prepare_button_css($templates);
                    break;
                case 'menu_more_actions':
                    $templates_list[] = array('id' => $templates['id'], 'name' => $button_title, 'entities_id' => $templates['entities_id'], 'button_icon' => $button_icon);
                    break;
                case 'menu_with_selected':
                    $templates_list[] = array('id' => $templates['id'], 'name' => $button_title, 'entities_id' => $templates['entities_id'], 'button_icon' => $button_icon);
                    break;
                case 'menu_export':
                    $html .= '<li>' . link_to_modalbox('<i class="fa ' . $button_icon . '"></i> ' . $button_title, url_for('items/xml_export', 'path=' . $_GET['path'] . '&templates_id=' . $templates['id']), ['style' => $style]) . '</li>';
                    break;
                case 'menu_with_selected_dashboard':
                    $html .= '<li>' . link_to_modalbox('<i class="fa ' . $button_icon . '"></i> ' . $button_title, url_for('items/xml_export_multiple', 'templates_id=' . $templates['id'] . $url_params), ['style' => $style]) . '</li>';
                    break;
            }
        }

        switch($position)
        {
            case 'default':
            case 'menu_with_selected_dashboard':
                return $html;
                break;
            case 'menu_more_actions':
            case 'menu_with_selected':
                return $templates_list;
                break;
            case 'menu_export':
                if(strlen($html))
                {
                    return '
							<li>
					  	 <div class="btn-group">
									<button class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown" data-hover="dropdown">
									<i class="fa fa-file-code-o"></i> ' . TEXT_EXPORT . ' <i class="fa fa-angle-down"></i>
									</button>
									<ul class="dropdown-menu" role="menu">
									' . $html . '
									</ul>
								</div>
							</li>
							';
                }
                else
                {
                    return '';
                }
                break;
        }
    }

    static public function prepare_button_css($buttons)
    {
        $css = '';

        if(strlen($buttons['button_color']))
        {
            $rgb = convert_html_color_to_RGB($buttons['button_color']);
            $rgb[0] = $rgb[0] - 25;
            $rgb[1] = $rgb[1] - 25;
            $rgb[2] = $rgb[2] - 25;
            $css = '
					<style>
						.btn-template-' . $buttons['id'] . '{
							background-color: ' . $buttons['button_color'] . ';
						  border-color: ' . $buttons['button_color'] . ';
						}
						.btn-primary.btn-template-' . $buttons['id'] . ':hover,
						.btn-primary.btn-template-' . $buttons['id'] . ':focus,
						.btn-primary.btn-template-' . $buttons['id'] . ':active,
						.btn-primary.btn-template-' . $buttons['id'] . '.active{
						  background-color: rgba(' . $rgb[0] . ',' . $rgb[1] . ',' . $rgb[2] . ',1);
						  border-color: rgba(' . $rgb[0] . ',' . $rgb[1] . ',' . $rgb[2] . ',1);
						}
					</style>
			';
        }

        return $css;
    }

    static function count_filters($templates_id)
    {
        $count = 0;
        $reports_info_query = db_query("select id from app_reports where reports_type='xml_export" . $templates_id . "'");
        if($reports_info = db_fetch_array($reports_info_query))
        {
            $count_query = db_query("select count(*) as total from app_reports_filters where reports_id='" . $reports_info['id'] . "'");
            $count = db_fetch_array($count_query);

            $count = $count['total'];
        }

        return $count;
    }

    static public function check_buttons_filters($buttons)
    {
        global $current_item_id, $current_entity_id, $sql_query_having;

        $reports_info_query = db_query("select id from app_reports where entities_id='" . db_input($buttons['entities_id']) . "' and reports_type='xml_export" . $buttons['id'] . "'");
        if($reports_info = db_fetch_array($reports_info_query))
        {
            $listing_sql_query = '';
            $listing_sql_query_select = '';
            $listing_sql_query_having = '';
            $sql_query_having = array();

            //prepare forumulas query
            $listing_sql_query_select = fieldtype_formula::prepare_query_select($current_entity_id, $listing_sql_query_select);

            $listing_sql_query = reports::add_filters_query($reports_info['id'], $listing_sql_query);

            //prepare having query for formula fields
            if(isset($sql_query_having[$current_entity_id]))
            {
                $listing_sql_query_having = reports::prepare_filters_having_query($sql_query_having[$current_entity_id]);
            }

            $listing_sql_query .= $listing_sql_query_having;

            $item_info_sql = "select e.id " . $listing_sql_query_select . " from app_entity_" . $buttons['entities_id'] . " e  where e.id='" . $current_item_id . "' " . $listing_sql_query;

            $item_info_query = db_query($item_info_sql);
            if($item_info = db_fetch_array($item_info_query))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        else
        {
            return true;
        }
    }

    static function get_users_templates($entities_id)
    {
        global $app_user;

        $templates_list = array();

        $templates_query = db_query("select ep.* from app_ext_xml_export_templates ep, app_entities e where ep.is_active=1 and e.id=ep.entities_id and ep.entities_id='" . db_input($entities_id) . "' and (find_in_set(" . $app_user['group_id'] . ",users_groups) or find_in_set(" . $app_user['id'] . ",assigned_to)) order by ep.sort_order, ep.name");
        while($templates = db_fetch_array($templates_query))
        {
            $templates_list[] = array('id' => $templates['id'], 'name' => $templates['name'], 'entities_id' => $templates['entities_id']);
        }

        return $templates_list;
    }

    static function has_users_access($entities_id, $templates_id)
    {
        global $app_user;

        $templates_query = db_query("select ep.* from app_ext_xml_export_templates ep, app_entities e where e.id=ep.entities_id and ep.entities_id='" . db_input($entities_id) . "' and (find_in_set(" . db_input($app_user['group_id']) . ",users_groups) or find_in_set(" . db_input($app_user['id']) . ",assigned_to)) and ep.id='" . db_input($templates_id) . "' order by ep.sort_order, ep.name");
        if($templates = db_fetch_array($templates_query))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

}
