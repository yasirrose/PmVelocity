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

$accounts_entities_query = db_query("select me.*, ma.name as server_name,e.name as entities_name, e.parent_id from app_ext_mail_accounts_entities me left join app_ext_mail_accounts ma on me.accounts_id=ma.id left join app_entities e on me.entities_id=e.id where  me.id='" . _get::int('account_entities_id'). "' order by id");
if(!$accounts_entities = db_fetch_array($accounts_entities_query))
{
	redirect_to('ext/mail_integration/entities');
}

switch($app_module_action)
{
	case 'save':
		$sql_data = array(				
				'account_entities_id'=>$accounts_entities['id'],				
				'from_email'=>$_POST['from_email'],
				'has_words'=>$_POST['has_words'],				
		);
				
		if(isset($_GET['id']))
		{
			db_perform('app_ext_mail_accounts_entities_rules',$sql_data,'update',"id='" . db_input($_GET['id']) . "'");
		}
		else
		{
			db_perform('app_ext_mail_accounts_entities_rules',$sql_data);
		}
		
		redirect_to('ext/mail_integration/entities_rules','account_entities_id=' . $accounts_entities['id']);
		break;
	case 'delete':
		
		db_delete_row('app_ext_mail_accounts_entities_rules',_get::int('id'));
			
		redirect_to('ext/mail_integration/entities_rules','account_entities_id=' . $accounts_entities['id']);
		break;
}