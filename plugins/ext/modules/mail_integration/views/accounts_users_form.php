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

<?php echo ajax_modal_template_header(TEXT_INFO) ?>

<?php echo form_tag('configuration_form', url_for('ext/mail_integration/accounts_users','action=save&accounts_id=' . _get::int('accounts_id') . (isset($_GET['id']) ? '&id=' . $_GET['id']:'') ),array('class'=>'form-horizontal')) ?>
<div class="modal-body">
  <div class="form-body">
            
 
 		<div class="form-group">
    	<label class="col-md-3 control-label" for="users_id"><?php echo TEXT_USER ?></label>
      <div class="col-md-9">	
    	  <?php echo select_tag('users_id',users::get_choices(),$obj['users_id'],array('class'=>'form-control input-xlarge chosen-select')) ?>        
      </div>			
    </div>
	       
    <!-- div class="form-group">
    	<label class="col-md-3 control-label" for="send_mail_as"><?php echo TEXT_EXT_SEND_MAIL_AS ?></label>
      <div class="col-md-9">	
    	  <?php echo input_tag('send_mail_as',$obj['send_mail_as'],array('class'=>'form-control input-large ')) ?>
    	  <?php echo tooltip_text(TEXT_DEFAULT . ': ' . $accounts_info['name'])?>        
      </div>			
    </div-->
    
    <div class="form-group">
    	<label class="col-md-3 control-label" for="signature"><?php echo TEXT_EXT_SIGNATURE ?></label>
      <div class="col-md-9">	
    	  <?php echo textarea_tag('signature',$obj['signature'],array('class'=>'form-control editor input-xlarge')) ?>        
      </div>			
    </div>
    
        
   </div>
</div> 
 
<?php echo ajax_modal_template_footer() ?>

</form> 

<script>
  $(function() { 
    
    $('#configuration_form').validate({
			submitHandler: function(form){
				app_prepare_modal_action_loading(form)
				form.submit();
			}
    }); 
                                                                                                         
  });
</script>  