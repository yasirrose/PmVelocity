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

$current_reports_info_query = db_query("select * from app_reports where id='" . _get::int('reports_id') . "'");
if(!$current_reports_info = db_fetch_array($current_reports_info_query))
{
  $alerts->add(TEXT_REPORT_NOT_FOUND,'error');
  redirect_to('dashboard/page_not_found');
}

switch($app_module_action)
{
  case 'save':
    
		    $values = '';
		    
		    if(isset($_POST['values']))
		    {
		      if(is_array($_POST['values']))
		      {
		        $values = implode(',',$_POST['values']);
		      }
		      else
		      {
		        $values = $_POST['values'];
		      }
		    }
		    $sql_data = array(
                        'reports_id'=>(isset($_GET['parent_reports_id']) ? $_GET['parent_reports_id']:$_GET['reports_id']),
                        'fields_id'=>$_POST['fields_id'],
                        'filters_condition'=>isset($_POST['filters_condition']) ? $_POST['filters_condition']: '',                                              
                        'filters_values'=>$values,
                        'is_active'=>1,
		    );
		        
		    if(isset($_GET['id']))
		    {        
		      db_perform('app_reports_filters',$sql_data,'update',"id='" . db_input($_GET['id']) . "'");
		      $filters_id = $_GET['id'];
		    }
		    else
		    {               
		      db_perform('app_reports_filters',$sql_data);
		      $filters_id = db_insert_id();
		    }
		    
		    if(isset($_POST['save_as_template']))
		    {
		    	$filters_info = db_find('app_reports_filters',$filters_id);
		    
		    	$check_query = db_query("select count(*) as total from app_reports_filters_templates where fields_id='" . db_input($filters_info['fields_id']) . "' and filters_condition='" . db_input($filters_info['filters_condition']) . "' and filters_values='" . db_input($filters_info['filters_values']) . "' and users_id='" . db_input($app_logged_users_id) . "'");
		    	$check = db_fetch_array($check_query);
		    
		    	if($check['total']==0 and strlen($filters_info['filters_values'])>0)
		    	{
		    		$sql_data = array(
		    				'fields_id'=>$filters_info['fields_id'],
		    				'filters_condition'=>$filters_info['filters_condition'],
		    				'filters_values'=>$filters_info['filters_values'],
		    				'users_id'=>$app_logged_users_id,
		    		);
		    			
		    		db_perform('app_reports_filters_templates',$sql_data);
		    	}		    
		    }
		    
		    redirect_to('default_filters/filters','redirect_to=' . $app_redirect_to . '&reports_id=' . $_GET['reports_id']);
                 
  	break;
  case 'delete':
      if(isset($_GET['id']))
      {      
        if($_GET['id']=='all')
        {
          db_query("delete from app_reports_filters where reports_id='" . db_input((isset($_GET['parent_reports_id']) ? $_GET['parent_reports_id']:$_GET['reports_id'])) . "'");
          $alerts->add(TEXT_WARN_DELETE_ALL_FILTERS_SUCCESS,'success');
        }
        else
        {
          db_query("delete from app_reports_filters where id='" . db_input($_GET['id']) . "'");          
          //$alerts->add(TEXT_WARN_DELETE_FILTER_SUCCESS,'success');
        }
         
      }
      
      redirect_to('default_filters/filters','redirect_to=' . $app_redirect_to . '&reports_id=' . $_GET['reports_id']);
    break;  
  
}


