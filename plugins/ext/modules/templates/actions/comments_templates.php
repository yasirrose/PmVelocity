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

if (!app_session_is_registered('comments_templates_filter')) 
{
  $comments_templates_filter = 0;
  app_session_register('comments_templates_filter');    
} 

switch($app_module_action)
{
  case 'set_comments_templates_filter':
      $comments_templates_filter = $_POST['comments_templates_filter'];
      
      redirect_to('ext/templates/comments_templates');
    break;
  case 'sort_templates':
        if(isset($_POST['templates'])) 
        {
          $sort_order = 0;
          foreach(explode(',',$_POST['templates']) as $v)
          {
            $sql_data = array('sort_order'=>$sort_order);
            db_perform('app_ext_comments_templates',$sql_data,'update',"id='" . db_input(str_replace('template_','',$v)) . "'");
            $sort_order++;
          }
        }
      exit();
    break;  
  case 'save':
    $sql_data = array('name'=>$_POST['name'],
                      'entities_id'=>$_POST['entities_id'],
                      'is_active' => (isset($_POST['is_active']) ? 1:0),
                      'description'=>$_POST['description'],
                      'sort_order'=>$_POST['sort_order'],
                      'users_groups' => (isset($_POST['users_groups']) ? implode(',',$_POST['users_groups']):''),                                            
                      'assigned_to' => (isset($_POST['assigned_to']) ? implode(',',$_POST['assigned_to']):''),
                      );
        
    if(isset($_GET['id']))
    { 
      //check if template entity was changed and reset fields   
      $template_info = db_find('app_ext_comments_templates',$_GET['id']);
      if($template_info['entities_id']!=$_POST['entities_id'])
      {
        db_query("delete from app_ext_comments_templates_fields where templates_id='" . db_input($_GET['id']) . "'");
      }
                           
      db_perform('app_ext_comments_templates',$sql_data,'update',"id='" . db_input($_GET['id']) . "'");       
    }
    else
    {                     
      db_perform('app_ext_comments_templates',$sql_data);                              
    }
        
    redirect_to('ext/templates/comments_templates');      
  break;
  case 'delete':
      if(isset($_GET['id']))
      {      
              
        db_query("delete from app_ext_comments_templates where id='" . db_input($_GET['id']) . "'");
        db_query("delete from app_ext_comments_templates_fields where templates_id='" . db_input($_GET['id']) . "'");
                            
        $alerts->add(TEXT_EXT_WARN_DELETE_TEMPLATE_SUCCESS,'success');
                     
        redirect_to('ext/templates/comments_templates');  
      }
    break;   
}