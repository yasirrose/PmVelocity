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

<h3 class="page-title"><?php echo TEXT_SERVER_LOAD ?></h3>

<p><?php echo TEXT_SERVER_LOAD_INFO ?></p>
<p><?php echo TEXT_CACHE_FOLDER .': ' . DIR_FS_CACHE ?></p>

<?php echo form_tag('cfg', url_for('configuration/save','redirect_to=configuration/server_load'),array('class'=>'form-horizontal')) ?>
<div class="form-body">

<p class="form-section form-section-0"><?php echo TEXT_REPORTS_IN_HEADER_MENU ?></p>
  <div class="form-group">
  	<label class="col-md-3 control-label" for="CFG_LDAP_USE"><?php echo TEXT_USE_CACHE ?></label>
    <div class="col-md-9">	
  	  <?php echo select_tag('CFG[USE_CACHE_REPORTS_IN_HEADER]', $default_selector ,CFG_USE_CACHE_REPORTS_IN_HEADER,array('class'=>'form-control input-small')); ?>
  	  <?php echo tooltip_text(TEXT_REPORTS_IN_HEADER_MENU_CACHE_INFO) ?>
    </div>			
  </div>
  
  <div class="form-group">
  	<label class="col-md-3 control-label" for="CFG_LDAP_SERVER_NAME"><?php echo tooltip_icon(TEXT_CACHE_LIVETIME_INFO) . TEXT_CACHE_LIVETIME ?></label>
    <div class="col-md-9">	
  	  <?php echo input_tag('CFG[CACHE_REPORTS_IN_HEADER_LIFETIME]', CFG_CACHE_REPORTS_IN_HEADER_LIFETIME,array('class'=>'form-control input-small')); ?>
    </div>			
  </div>
   
<?php echo submit_tag(TEXT_BUTTON_SAVE) ?>
 
</div>
</form>

 

