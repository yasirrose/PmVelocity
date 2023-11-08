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

<?php echo ajax_modal_template_header(TEXT_EXT_SHARE_THIS_CALENDAR) ?>

<?php echo form_tag('form_ics', icalendar::generate_url($_GET['type'], $_GET['id'] ?? 0 ) . '&download=1')?>
<div class="modal-body">
    <p><?php echo TEXT_EXT_SHARE_THIS_CALENDAR_TIP ?></p>
    
    <?php echo textarea_tag('url', icalendar::generate_url($_GET['type'], $_GET['id'] ?? 0 ) . '#' . time() ,['class'=>'form-control textarea-small select-all','readonly'=>'readonly'])?>
    <?php echo tooltip_text(TEXT_EXT_ENALBE_ICAL_GMT_TIP) ?>
</div>

<?php echo ajax_modal_template_footer(TEXT_DOWNLOAD . ' .ics') ?>
</form>