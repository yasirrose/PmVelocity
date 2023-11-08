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

$obj = array();

if(isset($_GET['id']))
{
	$obj = db_find('app_ext_xml_export_templates',$_GET['id']);
}
else
{
	$obj = db_show_columns('app_ext_xml_export_templates');

	if($xml_templates_filter>0)
	{
	    $obj['entities_id'] = $xml_templates_filter;
	}

	$obj['is_active'] = 1;
	$obj['is_public'] = 0;
	
}