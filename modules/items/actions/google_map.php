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

switch ($app_module_action)
{
    case 'save_value_in':
        $filed_id = _post::int('filed_id');
        $distance =(is_numeric($_POST['distance']) ? $_POST['distance'] : 0);

        $item_info_query = db_query("select field_{$filed_id} from app_entity_{$current_entity_id} where id={$current_item_id}");
        if ($item_info = db_fetch_array($item_info_query))
        {
            if($item_info['field_' . $filed_id]!=$distance)
            {
                db_query("update app_entity_{$current_entity_id} set field_{$filed_id}={$distance} where id={$current_item_id}");
                
                echo 'UPDATED';
            }
        }
        exit();
        break;
    case 'update_latlng':

        $filed_id = _post::int('filed_id');

        $item_info_query = db_query("select field_{$filed_id} from app_entity_{$current_entity_id} where id={$current_item_id}");
        if ($item_info = db_fetch_array($item_info_query))
        {

            //get current address
            if (strlen($item_info['field_' . $filed_id]))
            {
                $value = explode("\t", $item_info['field_' . $filed_id]);

                //print_r($value);

                $current_address = $value[2];

                $value = $_POST['lat'] . "\t" . $_POST['lng'] . "\t" . $current_address;

                db_query("update app_entity_{$current_entity_id} set field_{$filed_id}='" . db_input($value) . "' where id='" . db_input($current_item_id) . "'");
            }
        }

        exit();
        break;
    case 'update_latlng_multiple':
        $filed_id = _post::int('filed_id');
        $address_key = _post::int('address_key');

        $item_info_query = db_query("select field_{$filed_id} from app_entity_{$current_entity_id} where id={$current_item_id}");
        if ($item_info = db_fetch_array($item_info_query))
        {

            //get current address
            if (strlen($item_info['field_' . $filed_id]))
            {
                $item_address_array = preg_split("/\\r\\n|\\r|\\n/", $item_info['field_' . $filed_id]);

                if (isset($item_address_array[$address_key]))
                {
                    if (strlen($item_address_array[$address_key]))
                    {
                        $value = explode("\t", $item_address_array[$address_key]);

                        $item_address_array[$address_key] = $_POST['lat'] . "\t" . $_POST['lng'] . "\t" . $value[2];
                    }
                }

                db_query("update app_entity_{$current_entity_id} set field_{$filed_id}='" . db_input(implode("\n", $item_address_array)) . "' where id='" . db_input($current_item_id) . "'");
            }
        }
        break;
    case 'update_latlng_directions':
        //print_r($_POST);

        $filed_id = _post::int('filed_id');
        $lat = $_POST['lat'];
        $lng = $_POST['lng'];

        $item_info_query = db_query("select field_{$filed_id} from app_entity_{$current_entity_id} where id={$current_item_id}");
        if ($item_info = db_fetch_array($item_info_query))
        {
            if (strlen($item_info['field_' . $filed_id]))
            {
                $item_address_array = preg_split("/\\r\\n|\\r|\\n/", $item_info['field_' . $filed_id]);

                foreach ($lat as $address_key => $lat_value)
                {
                    if (isset($item_address_array[$address_key]))
                    {
                        if (strlen($item_address_array[$address_key]))
                        {
                            $value = explode("\t", $item_address_array[$address_key]);

                            $item_address_array[$address_key] = $lat[$address_key] . "\t" . $lng[$address_key] . "\t" . $value[2];
                        }
                    }
                }

                //print_r($item_address_array);

                db_query("update app_entity_{$current_entity_id} set field_{$filed_id}='" . db_input(implode("\n", $item_address_array)) . "' where id='" . db_input($current_item_id) . "'");
            }
        }
        break;
}		