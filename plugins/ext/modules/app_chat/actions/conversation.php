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

switch($app_module_action)
{
	case 'save':
		$sql_data = array(
				'users_id' => $app_user['id'],
				'name'=>db_prepare_input($_POST['name']),
				'menu_icon'=>db_prepare_input($_POST['menu_icon']),
				'menu_icon_color'=>db_prepare_input($_POST['menu_icon_color']),
				'assigned_to' => (is_array($_POST['assigned_to']) ? implode(',',$_POST['assigned_to']):''),
				'description'=>db_prepare_input($_POST['description']),
				'date_added' => time(),
		);
		
		if(isset($_GET['id']))
		{
			db_perform('app_ext_chat_conversations',$sql_data,'update',"id='" . db_input($_GET['id']) . "'  and users_id='" . $app_user['id'] . "'");
			$conversations_id = $_GET['id']; 
		}
		else
		{
			db_perform('app_ext_chat_conversations',$sql_data);
			$conversations_id = db_insert_id();
		}
		
		echo $conversations_id;
		
		exit();
		
		break;
	case 'delete':
			
		  $conversations_query = db_query("select * from app_ext_chat_conversations where id='" . _get::int('id') . "' and users_id='" . $app_user['id'] . "'");
		 	if($conversations = db_fetch_array($conversations_query))
		 	{
				db_query("delete from app_ext_chat_conversations where id='" . $conversations['id'] . "' and users_id='" . $app_user['id'] . "'");
				db_query("delete from app_ext_chat_conversations_messages where conversations_id='" . $conversations['id'] . "'");
				db_query("delete from app_ext_chat_unread_messages where conversations_id='" . $conversations['id'] . "'");				
		 	}
								
			exit();
		break;
}