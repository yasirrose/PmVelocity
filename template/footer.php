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
?>

<div class="footer noprint">
<div class="footer-inner">
	 <?php echo ((!is_null(CFG_APP_COPYRIGHT_NAME) and strlen(CFG_APP_COPYRIGHT_NAME))>0 ? '&copy; ' . CFG_APP_COPYRIGHT_NAME . ' ' .  date('Y') . '<br>': '') ?>
     <?php echo app_powered_by_text() ?>
</div>
<div class="footer-tools">
	
</div>
</div>