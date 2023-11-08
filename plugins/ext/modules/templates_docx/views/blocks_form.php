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

<?php echo form_tag('templates_form', url_for('ext/templates_docx/blocks','templates_id=' . _GET('templates_id') . '&action=save' . (isset($_GET['id']) ? '&id=' . $_GET['id']:'') ),array('class'=>'form-horizontal')) ?>

<div class="modal-body">
  <div class="form-body">
  
  <div class="form-group">
  	<label class="col-md-3 control-label" for="fields_id"><?php echo TEXT_FIELD ?></label>
    <div class="col-md-9"><?php echo select_tag('fields_id',export_templates_blocks::get_fields_choices($obj['fields_id'], $template_info['id'], $template_info['entities_id']),$obj['fields_id'],array('class'=>'form-control input-xlarge chosen-select required')) ?>
    </div>			
  </div>
  
  <div class="form-group">
  	<label class="col-md-3 control-label" for="fields_id"><?php echo TEXT_SORT_ORDER ?></label>
    <div class="col-md-9"><?php echo input_tag('sort_order',$obj['sort_order'],['class'=>'form-control input-xsmall']) ?></div>			
  </div>
  
  <div id="block_settings"></div>
  
  
  
  </div>
</div> 
 
<?php echo ajax_modal_template_footer() ?>

</form> 

<script>
  $(function() { 
    $('#templates_form').validate({
			submitHandler: function(form){
				app_prepare_modal_action_loading(form)
				return true;
			}
	  });

    block_settings();

    $('#fields_id').change(function(){
    	block_settings();
    })
    
  });


  function block_settings()
  { 
	fields_id = $('#fields_id').val();
    
    $('#block_settings').html('<div class="ajax-loading"></div>');
     
    $('#block_settings').load('<?php echo url_for("ext/templates_docx/blocks_settings",'templates_id=' . _GET('templates_id') ) ?>',{fields_id:fields_id, id:'<?php echo $obj["id"] ?>'},function(response, status, xhr) {
      if (status == "error") {                                 
         $(this).html('<div class="alert alert-error"><b>Error:</b> ' + xhr.status + ' ' + xhr.statusText+'<div>'+response +'</div></div>')                    
      }
      else
      {
        appHandleUniform();
        
        jQuery(window).resize();      
      }    
    });  
     
  }   
</script>