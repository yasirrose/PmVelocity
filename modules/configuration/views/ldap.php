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
<h3 class="page-title"><?php echo TEXT_HEADING_LDAP ?></h3>

<p><?php echo TEXT_LDAP_INFO ?></p>

<?php echo form_tag('cfg', url_for('configuration/save','redirect_to=configuration/ldap'),array('class'=>'form-horizontal')) ?>
<div class="form-body">

  <div class="form-group">
  	<label class="col-md-3 control-label" for="CFG_LDAP_USE"><?php echo TEXT_LDAP_USE ?></label>
    <div class="col-md-9">	
  	  <?php echo select_tag('CFG[LDAP_USE]', $default_selector ,CFG_LDAP_USE,array('class'=>'form-control input-small')); ?>
    </div>			
  </div>
  
  <div class="form-group">
  	<label class="col-md-3 control-label" for="CFG_LDAP_USE"><?php echo TEXT_USE_LDAP_LOGIN_ONLY ?></label>
    <div class="col-md-9">
    	<p class="form-control-static"><?php echo app_render_status_label(CFG_USE_LDAP_LOGIN_ONLY)?></p>	  	      	
    </div>			
  </div>
  
  <div class="form-group">
  	<label class="col-md-3 control-label" for="CFG_LDAP_SERVER_NAME"><?php echo TEXT_LDAP_SERVER_NAME ?></label>
    <div class="col-md-9">	
  	  <?php echo input_tag('CFG[LDAP_SERVER_NAME]', CFG_LDAP_SERVER_NAME,array('class'=>'form-control input-large')) . '<span class="help-block">' . TEXT_LDAP_SERVER_NAME_NOTES . '</span>'; ?>
    </div>			
  </div>
  
  <div class="form-group">
  	<label class="col-md-3 control-label" for="CFG_LDAP_SERVER_PORT"><?php echo TEXT_LDAP_SERVER_PORT ?></label>
    <div class="col-md-9">	
  	  <?php echo input_tag('CFG[LDAP_SERVER_PORT]', CFG_LDAP_SERVER_PORT,array('class'=>'form-control input-large')). '<span class="help-block">' . TEXT_LDAP_SERVER_PORT_NOTES . '</span>'; ?>
    </div>			
  </div>
  
  <div class="form-group">
  	<label class="col-md-3 control-label" for="CFG_LDAP_BASE_DN"><?php echo TEXT_LDAP_BASE_DN ?></label>
    <div class="col-md-9">	
  	  <?php echo input_tag('CFG[LDAP_BASE_DN]', CFG_LDAP_BASE_DN,array('class'=>'form-control input-large')). '<span class="help-block">' . TEXT_LDAP_BASE_DN_NOTES . '</span>'; ?>
    </div>			
  </div>
  
  <div class="form-group">
  	<label class="col-md-3 control-label" for="CFG_LDAP_UID"><?php echo TEXT_LDAP_UID ?></label>
    <div class="col-md-9">	
  	  <?php echo input_tag('CFG[LDAP_UID]', CFG_LDAP_UID,array('class'=>'form-control input-large')). '<span class="help-block">' . TEXT_LDAP_UID_NOTES . '</span>'; ?>
    </div>			
  </div>
  
  <div class="form-group">
  	<label class="col-md-3 control-label" for="CFG_LDAP_USER"><?php echo TEXT_LDAP_USER_FILTER ?></label>
    <div class="col-md-9">	
  	  <?php echo input_tag('CFG[LDAP_USER]', CFG_LDAP_USER,array('class'=>'form-control input-large')). '<span class="help-block">' . TEXT_LDAP_USER_FILTER_NOTES . '</span>'; ?>
    </div>			
  </div>
  
  <div class="form-group">
  	<label class="col-md-3 control-label" for="CFG_LDAP_EMAIL_ATTRIBUTE"><?php echo TEXT_LDAP_EMAIL_ATTRIBUTE ?></label>
    <div class="col-md-9">	
  	  <?php echo input_tag('CFG[LDAP_EMAIL_ATTRIBUTE]', CFG_LDAP_EMAIL_ATTRIBUTE,array('class'=>'form-control input-large')). '<span class="help-block">' . TEXT_LDAP_EMAIL_ATTRIBUTE_NOTES . '</span>'; ?>
    </div>			
  </div>
  
  <div class="form-group">
  	<label class="col-md-3 control-label" for="CFG_LDAP_FIRSTNAME_ATTRIBUTE"><?php echo TEXT_LDAP_FIRSTNAME ?></label>
    <div class="col-md-9">	
  	  <?php echo input_tag('CFG[LDAP_FIRSTNAME_ATTRIBUTE]', CFG_LDAP_FIRSTNAME_ATTRIBUTE,array('class'=>'form-control input-large')). '<span class="help-block">' . TEXT_LDAP_FIRSTNAME_NOTE . '</span>'; ?>
    </div>			
  </div>
  
  <div class="form-group">
  	<label class="col-md-3 control-label" for="CFG_LDAP_LASTNAME_ATTRIBUTE"><?php echo TEXT_LDAP_LASTNAME ?></label>
    <div class="col-md-9">	
  	  <?php echo input_tag('CFG[LDAP_LASTNAME_ATTRIBUTE]', CFG_LDAP_LASTNAME_ATTRIBUTE,array('class'=>'form-control input-large')). '<span class="help-block">' . TEXT_LDAP_LASTNAME_NOTE . '</span>'; ?>
    </div>			
  </div>
    
  <div class="form-group">
  	<label class="col-md-3 control-label" for="CFG_LDAP_USER_DN"><?php echo TEXT_LDAP_USER_DN ?></label>
    <div class="col-md-9">	
  	  <?php echo input_tag('CFG[LDAP_USER_DN]', CFG_LDAP_USER_DN,array('class'=>'form-control input-large')). '<span class="help-block">' . TEXT_LDAP_USER_DN_NOTES . '</span>'; ?>
    </div>			
  </div>
  
  <div class="form-group">
  	<label class="col-md-3 control-label" for="CFG_LDAP_PASSWORD"><?php echo TEXT_LDAP_PASSWORD ?></label>
    <div class="col-md-9">	
  	  <?php echo input_tag('CFG[LDAP_PASSWORD]', CFG_LDAP_PASSWORD,array('class'=>'form-control input-large')). '<span class="help-block">' . TEXT_LDAP_PASSWORD_NOTES . '</span>'; ?>
    </div>			
  </div>
  
<?php echo submit_tag(TEXT_BUTTON_SAVE) ?>
 
</div>
</form>

 

