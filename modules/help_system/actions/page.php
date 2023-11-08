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

$page_id = _get::int('id');

$page_info_query = db_query("select * from app_help_pages where type='page' and id='" . $page_id . "' and find_in_set(" . $app_user['group_id'] . ", users_groups) and is_active=1");
if(!$page_info = db_fetch_array($page_info_query))
{
	redirect_to('dashboard/page_not_found');
}