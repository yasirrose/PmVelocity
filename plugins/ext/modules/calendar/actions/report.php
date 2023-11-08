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

//check if report exist
$reports_query = db_query("select * from app_ext_calendar where id='" . db_input($_GET['id']) . "'");
if(!$reports = db_fetch_array($reports_query))
{
    redirect_to('dashboard/page_not_found');
}

app_set_title($reports['name']);

if(!calendar::user_has_reports_access($reports))
{
    redirect_to('dashboard/access_forbidden');
}

if(isset($_GET['path']))
{
    //check if report entity is exist in path
    if(!strstr($_GET['path'], '/' . $reports['entities_id']))
    {
        redirect_to('dashboard');
    }
}

//create default entity report for logged user
$reports_info_query = db_query("select * from app_reports where entities_id='" . db_input($reports['entities_id']) . "' and reports_type='calendarreport" . $reports['id'] . "' and created_by='" . $app_logged_users_id . "'");
if(!$reports_info = db_fetch_array($reports_info_query))
{
    $sql_data = array('name' => '',
        'entities_id' => $reports['entities_id'],
        'reports_type' => 'calendarreport' . $reports['id'],
        'in_menu' => 0,
        'in_dashboard' => 0,
        'listing_order_fields' => '',
        'created_by' => $app_logged_users_id,
    );

    db_perform('app_reports', $sql_data);
    $fiters_reports_id = db_insert_id();
    
    $reports_info = db_find('app_reports', $fiters_reports_id);
}
else
{
    $fiters_reports_id = $reports_info['id'];
}

$entity_info = db_find('app_entities', $reports['entities_id']);

//check if parent reports was not set
if($entity_info['parent_id'] > 0 and $reports_info['parent_id'] == 0)
{
    reports::auto_create_parent_reports($reports_info['id']);
}


$heading_field_id = fields::get_heading_id($reports['entities_id']);

if(!$heading_field_id)
{
    $alerts->add(TEXT_ERROR_NO_HEADING_FIELD, 'warning');
}

switch($app_module_action)
{
    case 'resize':
        $item_info = db_find("app_entity_{$reports['entities_id']}",_POST('id'));
        
        $end = ($_POST['view_name']=='dayGridMonth' ? strtotime('-1 day',strtotime($_POST['end'])) : strtotime($_POST['end']));

        $sql_data = array('field_' . $reports['end_date'] => $end);

        db_perform("app_entity_" . $reports['entities_id'], $sql_data, 'update', "id='" . db_input($_POST['id']) . "'");
        
        $log = new track_changes($reports['entities_id'], _POST('id'));
        $log->log_update($item_info);

        exit();
        break;
    case 'drop':

        $item_info = db_find("app_entity_{$reports['entities_id']}",_POST('id'));
        
        if(isset($_POST['end']))
        {
            $end = ($_POST['view_name']=='dayGridMonth' ? strtotime('-1 day',strtotime($_POST['end'])) : strtotime($_POST['end']));
        }
        else
        {
            $end = strtotime($_POST['start']);
        }

        $sql_data = array('field_' . $reports['start_date'] => strtotime($_POST['start']),
            'field_' . $reports['end_date'] => $end);

        db_perform("app_entity_" . $reports['entities_id'], $sql_data, 'update', "id='" . db_input($_POST['id']) . "'");
        
        $log = new track_changes($reports['entities_id'], _POST('id'));
        $log->log_update($item_info);

        exit();
        break;
    case 'get_events':
        $list = array();

        if($reports['use_background'] > 0)
        {
            $use_background_field_info = db_find('app_fields', $reports['use_background']);
        }

        $entity_info = db_find('app_entities', $reports['entities_id']);

        $cfg_editable = calendar::user_has_reports_access($reports, 'full');

        $current_access_schema = $cfg_editable ? ['update']:[];
        $fields_access_schema = users::get_fields_access_schema($reports['entities_id'], $app_user['group_id']);

        $date_from = date('Y-m-d',strtotime($_POST['start']));
        $date_to = date('Y-m-d',strtotime($_POST['end']));

        $listing_sql_query = '';
        $listing_sql_query_having = '';
        $sql_query_having = array();

        $is_start_date_dynamic = ($app_fields_cache[$reports['entities_id']][$reports['start_date']]['type'] == 'fieldtype_dynamic_date' ? true : false);
        $is_end_date_dynamic = ($app_fields_cache[$reports['entities_id']][$reports['end_date']]['type'] == 'fieldtype_dynamic_date' ? true : false);

        $listing_sql_query_filter = " and ( (FROM_UNIXTIME(e.field_" . $reports['start_date'] . ",'%Y-%m-%d')>='" . $date_from . "' and  FROM_UNIXTIME(e.field_" . $reports['end_date'] . ",'%Y-%m-%d')<='" . $date_to . "') or 
                           (FROM_UNIXTIME(e.field_" . $reports['start_date'] . ",'%Y-%m-%d')<'" . $date_from . "' and  FROM_UNIXTIME(e.field_" . $reports['end_date'] . ",'%Y-%m-%d')>'" . $date_to . "') or
                           (FROM_UNIXTIME(e.field_" . $reports['start_date'] . ",'%Y-%m-%d')<'" . $date_from . "' and  FROM_UNIXTIME(e.field_" . $reports['end_date'] . ",'%Y-%m-%d')<='" . $date_to . "' and  FROM_UNIXTIME(e.field_" . $reports['end_date'] . ",'%Y-%m-%d')>='" . $date_from . "') or
                           (FROM_UNIXTIME(e.field_" . $reports['start_date'] . ",'%Y-%m-%d')>='" . $date_from . "' and FROM_UNIXTIME(e.field_" . $reports['start_date'] . ",'%Y-%m-%d')<='" . $date_to . "' and  FROM_UNIXTIME(e.field_" . $reports['end_date'] . ",'%Y-%m-%d')>'" . $date_to . "') 
                           ) ";

        if(!$is_start_date_dynamic and!$is_end_date_dynamic)
        {
            $listing_sql_query = $listing_sql_query_filter;
        }

        if(strlen($reports['filters_panel']))
        {
            $listing_sql_query = reports::add_filters_query($fiters_reports_id, $listing_sql_query);
        }

        if(isset($_GET['path']))
        {
            $path_info = items::parse_path($_GET['path']);
            if($path_info['parent_entity_item_id'] > 0)
            {
                $listing_sql_query .= " and e.parent_item_id='" . $path_info['parent_entity_item_id'] . "'";
            }
        }

        $listing_sql_query = items::add_access_query($reports['entities_id'], $listing_sql_query);

        //prepare forumulas query
        $listing_sql_query_select = fieldtype_formula::prepare_query_select($reports['entities_id'], '');

        //prepare dynamic dates
        if($is_start_date_dynamic)
        {
            $sql_query_having[$reports['entities_id']][] = "field_" . $reports['start_date'] . ">0";
            $cfg_editable = false;
        }

        if($is_end_date_dynamic)
        {
            $sql_query_having[$reports['entities_id']][] = "field_" . $reports['end_date'] . ">0";
            $cfg_editable = false;
        }

        if($is_start_date_dynamic or $is_end_date_dynamic)
        {
            $sql_query_having[$reports['entities_id']][] = substr(str_replace('e.', '', $listing_sql_query_filter), 4);
        }

        //prepare having query for formula fields
        if(isset($sql_query_having[$reports['entities_id']]))
        {
            $listing_sql_query_having = reports::prepare_filters_having_query($sql_query_having[$reports['entities_id']]);
        }

        if($app_fields_cache[$reports['entities_id']][$reports['start_date']]['type'] != 'fieldtype_dynamic_date')
        {
            $listing_sql_query .= " and e.field_" . $reports['start_date'] . ">0";
        }

        if($app_fields_cache[$reports['entities_id']][$reports['end_date']]['type'] != 'fieldtype_dynamic_date')
        {
            $listing_sql_query .= " and e.field_" . $reports['end_date'] . ">0";
        }

        //add having query
        $listing_sql_query .= $listing_sql_query_having;

        $events_query = db_query("select e.* " . $listing_sql_query_select . " from app_entity_" . $reports['entities_id'] . " e where e.id>0 " . $listing_sql_query, false);
        while($events = db_fetch_array($events_query))
        {
            //check access rules
            $is_editable = $cfg_editable;
            if($is_editable and $app_user['group_id']>0)
            {
                $access_rules = new access_rules($reports['entities_id'], $events);
                $fields_access_schema_rule = $fields_access_schema+$access_rules->get_fields_view_only_access();

                if(!users::has_access('update', $access_rules -> get_access_schema()) or isset($fields_access_schema_rule[$reports['start_date']]) or isset($fields_access_schema_rule[$reports['end_date']]))
                {
                    $is_editable = false;                
                }
            }
                                
            $start = date('Y-m-d H:i', $events['field_' . $reports['start_date']]);
            $end = date('Y-m-d H:i', $events['field_' . $reports['end_date']]);

            if(strstr($end, ' 00:00'))
            {
                $end = date('Y-m-d H:i', strtotime('+1 day', $events['field_' . $reports['end_date']]));
            }

            if(strlen($reports['heading_template']) > 0)
            {
                $options = array('custom_pattern' => $reports['heading_template'],
                    'item' => $events);

                $options['field']['configuration'] = '';

                $options['field']['entities_id'] = $reports['entities_id'];

                $fieldtype_text_pattern = new fieldtype_text_pattern();
                $title = $fieldtype_text_pattern->output($options);
            }
            else
            {
                $title = items::get_heading_field($reports['entities_id'], $events['id']);
            }


            //map color
            $className = 'fc-item-css';
            $color = '#3a87ad !important';
            if($reports['use_background'] > 0)
            {
                if(isset($events['field_' . $reports['use_background']]))
                {
                    $value_id = $events['field_' . $reports['use_background']];

                    $cfg = new fields_types_cfg($use_background_field_info['configuration']);

                    if($cfg->get('use_global_list') > 0)
                    {
                        $choices_cache = $app_global_choices_cache;
                    }
                    else
                    {
                        $choices_cache = $app_choices_cache;
                    }

                    if(isset($choices_cache[$value_id]))
                    {
                        if(strlen($choices_cache[$value_id]['bg_color']) > 0)
                        {
                            $color = $choices_cache[$value_id]['bg_color'];

                            $className = 'fc-item-css-' . $value_id;
                        }
                    }
                }
            }

            //prepare description
            $description = '';

            if(strlen($reports['fields_in_popup']))
            {
                $path_info = items::get_path_info($entity_info['id'],$events['id']);
                
                $description .= '<table>';

                foreach(explode(',', $reports['fields_in_popup']) as $fields_id)
                {
                    $field_query = db_query("select * from app_fields where id='" . $fields_id . "'");
                    if($field = db_fetch_array($field_query))
                    {
                        //prepare field value
                        $value = items::prepare_field_value_by_type($field, $events);

                        $output_options = array('class' => $field['type'],
                            'value' => $value,
                            'field' => $field,
                            'item' => $events,
                            'path_info'=>$path_info,
                            'is_export' => true,
                            'path' => '');

                        $value = trim(strip_tags(fields_types::output($output_options)));

                        if(strlen($value) > 255)
                            $value = mb_substr($value, 0, 255) . '...';

                        if(strlen($value))
                        {
                            $description .= '
		        			<tr>
		        				<td valign="top" style="padding-right: 7px;">' . ($field['short_name'] ? $field['short_name'] : fields_types::get_option($field['type'], 'name', $field['name'])) . '</td>
		        				<td valign="top">' . $value . '</td>
		        			</tr>';
                        }
                    }
                }
                $description .= '</table>';

                $description = str_replace(["\n", "\r", "\r\n", "\t"], '', $description);
            }

            /*
            if($entity_info['parent_id'] > 0 and!isset($_GET['path']))
            {
                $path_info = items::get_path_info($entity_info['id'], $events['id']);

                $title = str_replace('<br>', ' / ', $path_info['parent_name']) . ' / ' . $title;
            }             
            */

            $list[] = array('id' => $events['id'],
                'title' => $title,
                'description' => $description,
                'start' => str_replace(' 00:00', '', $start),
                'end' => str_replace(' 00:00', '', $end),
                'editable' => $is_editable,
                'allDay' => (strstr($start, '00:00') and strstr($end, '00:00')),
                'url' => url_for('items/info', 'path=' . $reports['entities_id'] . '-' . $events['id']),
                'className' => $className,
                'backgroundColor' => $color,
                'borderColor' => $color,
            );
        }

        echo json_encode($list);

        db_dev_log();

        exit();

        break;
}    

