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

$app_title = app_set_title(TEXT_USERS_ALERTS);

switch($app_module_action)
{
  case 'save':
               
    if(isset($_POST['position']))
    {
        $position = (is_array($_POST['position']) ? implode(',',$_POST['position']) : $_POST['position']);
    }
    else
    {
        $position = ''; 
    }
      
    $sql_data = array(
    	'is_active'	=> (isset($_POST['is_active']) ? 1:0),
    	'entities_id' => _get::int('entities_id'),
    	'type'	=> $_POST['type'],    	    
    	'color'	=> (isset($_POST['color']) ? $_POST['color'] : ''),
    	'position'	=> $position,
    	'start_date' => (isset($_POST['start_date']) ? (int)get_date_timestamp($_POST['start_date']):0),
    	'end_date' => (isset($_POST['end_date']) ? (int)get_date_timestamp($_POST['end_date']):0),
    	'name'	=> $_POST['name'],
    	'icon'	=> (isset($_POST['icon']) ? $_POST['icon'] : ''),
    	'description'	=> $_POST['description'],    	    	
    	'users_groups' => (isset($_POST['users_groups']) ? implode(',',$_POST['users_groups']):''),    	
    	'created_by' => $app_user['id'],
    	'sort_order' => $_POST['sort_order'],
    	
    );
        
    if(isset($_GET['id']))
    {                  
      db_perform('app_help_pages',$sql_data,'update',"id='" . db_input($_GET['id']) . "'");       
    }
    else
    {                     
      db_perform('app_help_pages',$sql_data);                             
    }
        
    redirect_to('help_pages/pages','entities_id=' .  _get::int('entities_id'));      
  break;
  case 'delete':
      if(isset($_GET['id']))
      {  
        db_query("delete from app_help_pages where id='" . _get::int('id') . "'");        
                     
        redirect_to('help_pages/pages','entities_id=' .  _get::int('entities_id'));  
      }
    break; 

}