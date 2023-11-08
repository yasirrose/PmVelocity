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

class mail_accounts_users
{
	//rest of list of users who has access to mail
	static function reset_cfg()
	{		
		$list = [];
		$accounts_users_query = db_query("select * from app_ext_mail_accounts_users");
		while($accounts_users = db_fetch_array($accounts_users_query))
		{
			$list[] = $accounts_users['users_id'];
		}
		
		configuration::set('CFG_MAIL_INTEGRATION_USERS',implode(',',$list));
	}
	
	static function has_access()
	{
		global $app_user;
		
		if(strlen(CFG_MAIL_INTEGRATION_USERS))
		{
			if(in_array($app_user['id'],explode(',',CFG_MAIL_INTEGRATION_USERS)))
			{
				return true;
			}
		}
		
		return false;
	}
	
	static function get_signature()
	{
		global $app_user;
		
		$accounts_users_query = db_query("select * from app_ext_mail_accounts_users where users_id='" . $app_user['id'] . "' and length(signature)>0");
		if($accounts_users = db_fetch_array($accounts_users_query))
		{
			return $accounts_users['signature'];
		}
		
		return '';
	}
	
}