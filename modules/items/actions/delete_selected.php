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

if (!users::has_access('delete'))
{
    redirect_to('dashboard/access_forbidden');
}

switch ($app_module_action)
{
    case 'delete_selected':

        if (!isset($app_selected_items[$_GET['reports_id']]))
            $app_selected_items[$_GET['reports_id']] = array();

        if (users::has_access('delete_creator'))
        {
            foreach ($app_selected_items[$_GET['reports_id']] as $k => $items_id)
            {
                $item_info_query = db_query("select created_by from app_entity_" . $current_entity_id . " where id='" . $items_id . "'");
                $item_info = db_fetch_array($item_info_query);
                if ($item_info['created_by'] != $app_user['id'])
                {
                    unset($app_selected_items[$_GET['reports_id']][$k]);
                }
            }
        }

        if (entities::has_subentities($current_entity_id) == 0 and $current_entity_id != 1)
        {
            if (count($app_selected_items[$_GET['reports_id']]) > 0)
            {
                foreach ($app_selected_items[$_GET['reports_id']] as $items_id)
                {
                    items::delete($current_entity_id, $items_id);
                }
            }
        }
        elseif (entities::has_subentities($current_entity_id) and $current_entity_id != 1)
        {
            if (count($app_selected_items[$_GET['reports_id']]) > 0)
            {
                $items_to_delete = items::get_items_to_delete($current_entity_id, [$current_entity_id => $app_selected_items[$_GET['reports_id']]]);

                foreach ($items_to_delete as $entity_id => $items_list)
                {
                    foreach ($items_list as $item_id)
                    {
                        items::delete($entity_id, $item_id);
                    }
                }
            }
        }

        switch ($app_redirect_to)
        {
            case 'parent_item_info_page':
                redirect_to('items/info', 'path=' . app_path_get_parent_path($app_path));
                break;
            case 'dashboard':
                redirect_to('dashboard/', substr($gotopage, 1));
                break;
            default:

                if (strstr($app_redirect_to, 'report_'))
                {
                    redirect_to('reports/view', 'reports_id=' . str_replace('report_', '', $app_redirect_to));
                }
                elseif (strstr($app_redirect_to, 'mail_info_page_'))
                {
                    redirect_to('ext/mail/info', 'id=' . str_replace('mail_info_page_', '', $app_redirect_to));
                }
                else
                {   
                    if($current_item_id)
                    {
                        $app_path = substr($app_path,0,-(strlen($current_item_id)+1));
                    }
                    
                    redirect_to('items/items', 'path=' . $app_path);
                }

                break;
        }


        break;
}