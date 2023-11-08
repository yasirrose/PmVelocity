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

<?php echo ajax_modal_template_header(TEXT_HEADING_DELETE) ?>

<?php 
	$entities_query = db_query("select gs.*, e.name from app_ext_global_search_entities gs, app_entities e where gs.id=" . _get::int('id') . " and gs.entities_id=e.id order by gs.sort_order,gs.id");
	$entities = db_fetch_array($entities_query)
?>

<?php echo form_tag('login', url_for('ext/global_search/entities','action=delete&id=' . $_GET['id'] )) ?>
    
<div class="modal-body">    
<?php echo sprintf(TEXT_DEFAULT_DELETE_CONFIRMATION,$entities['name'])?>
</div> 
 
<?php echo ajax_modal_template_footer(TEXT_BUTTON_DELETE) ?>

</form>    
    
 
