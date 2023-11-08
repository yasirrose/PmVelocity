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

/**
 *add pivot reports to menu
 */
$reports_query = db_query("select * from app_ext_pivotreports order by sort_order, name");
while($reports = db_fetch_array($reports_query))
{
	if(in_array($app_user['group_id'],explode(',',$reports['allowed_groups'])) or $app_user['group_id']==0)
	{
		$check_query = db_query("select id from app_entities_menu where find_in_set('pivotreports" . $reports['id']. "',reports_list)");
		if(!$check = db_fetch_array($check_query))
		{
			$app_plugin_menu['reports'][] = array('title'=>$reports['name'],'url'=>url_for('ext/pivotreports/view','id=' . $reports['id']));
		}
	}
}