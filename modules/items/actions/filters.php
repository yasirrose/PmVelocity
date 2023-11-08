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

$reports_info_query = db_query("select * from app_reports where id='" . db_input($_GET['reports_id']). "'");
if(!$reports_info = db_fetch_array($reports_info_query))
{
  $alerts->add(TEXT_REPORT_NOT_FOUND,'error');
  redirect_to('items/','path=' . $_GET['path']);
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
    $sql_data = array('reports_id'=>$_GET['reports_id'],
                      'fields_id'=>$_POST['fields_id'],
                      'filters_condition'=>$_POST['filters_condition'],                                              
                      'filters_values'=>$values,
                      );
        
    if(isset($_GET['id']))
    {        
      db_perform('app_reports_filters',$sql_data,'update',"id='" . db_input($_GET['id']) . "'");       
    }
    else
    {               
      db_perform('app_reports_filters',$sql_data);                  
    }
        
    redirect_to('items/filters','reports_id=' . $_GET['reports_id'] . '&path=' . $_GET['path']);      
  break;
  case 'delete':
      if(isset($_GET['id']))
      {      

        db_query("delete from app_reports_filters where id='" . db_input($_GET['id']) . "'");
                            
        $alerts->add(TEXT_WARN_DELETE_FILTER_SUCCESS,'success');
     
                
        redirect_to('items/filters','reports_id=' . $_GET['reports_id'] . '&path=' . $_GET['path']);  
      }
    break;   
}

$entity_info = db_find('app_entities',$current_entity_id);
$entity_cfg = entities::get_cfg($current_entity_id);

$entity_listing_heading = (strlen($entity_cfg['listing_heading'])>0 ? $entity_cfg['listing_heading'] : $entity_info['name']);