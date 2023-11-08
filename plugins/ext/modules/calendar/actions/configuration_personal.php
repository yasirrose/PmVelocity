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

//check access
if($app_user['group_id']>0)
{
  redirect_to('dashboard/access_forbidden');
}

if(!defined('CFG_PERSONAL_CALENDAR_SEND_ALERTS')) define('CFG_PERSONAL_CALENDAR_SEND_ALERTS',0);
if(!defined('CFG_PERSONAL_CALENDAR_ALERTS_TIME')) define('CFG_PERSONAL_CALENDAR_ALERTS_TIME','');
if(!defined('CFG_PERSONAL_CALENDAR_ALERTS_SUBJECT')) define('CFG_PERSONAL_CALENDAR_ALERTS_SUBJECT','');

