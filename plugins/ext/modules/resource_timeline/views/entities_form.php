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

<?php echo ajax_modal_template_header(TEXT_EXT_СALENDAR_REPORTS) ?>

<?php echo form_tag('configuration_form', url_for('ext/resource_timeline/entities','action=save&calendars_id=' . _get::int('calendars_id') . (isset($_GET['id']) ? '&id=' . $_GET['id']:'') ),array('class'=>'form-horizontal')) ?>
<div class="modal-body">
  <div class="form-body ajax-modal-width-790">
     
             
    <div class="form-group">
    	<label class="col-md-3 control-label" for="type"><?php echo TEXT_REPORT_ENTITY ?></label>
      <div class="col-md-9">	
    	  <?php echo select_tag('entities_id',entities::get_choices(), $obj['entities_id'],array('class'=>'form-control input-large required','onChange'=>'ext_get_entities_fields(this.value)')) ?>        
      </div>			
    </div>
    
    <div class="form-group">
	  	<label class="col-md-3 control-label" for="bg_color"><?php echo TEXT_BACKGROUND_COLOR ?></label>
	    <div class="col-md-9">
	    	<div class="input-group input-small color colorpicker-default" data-color="<?php echo (strlen($obj['bg_color'])>0 ? $obj['bg_color']:'#ff0000')?>" >
	  	   <?php echo input_tag('bg_color',$obj['bg_color'],array('class'=>'form-control input-small')) ?>
	        <span class="input-group-btn">
	  				<button class="btn btn-default" type="button">&nbsp;</button>
	  			</span>
	  		</div>      
	    </div>			
	  </div>
        
    <div id="reports_entities_fields"></div>  
           
   </div>
</div> 
 
<?php echo ajax_modal_template_footer() ?>

</form> 

<script>

  $(function() { 
    $('#configuration_form').validate();
                        
    ext_get_entities_fields($('#entities_id').val());
                                                                              
  });
  
function ext_get_entities_fields(entities_id)
{ 
  $('#reports_entities_fields').html('<div class="ajax-loading"></div>');
   
  $('#reports_entities_fields').load('<?php echo url_for("ext/resource_timeline/entities","action=get_entities_fields&calendars_id=" . _get::int('calendars_id'))?>',{entities_id:entities_id, id:'<?php echo $obj["id"] ?>'},function(response, status, xhr) {
    if (status == "error") {                                 
       $(this).html('<div class="alert alert-error"><b>Error:</b> ' + xhr.status + ' ' + xhr.statusText+'<div>'+response +'</div></div>')                    
    }
    else
    {
      appHandleUniform();
      $(window).resize()
    }    
  }); 
   
  
}   

  
</script>   