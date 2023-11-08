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

<?php echo ajax_modal_template_header(TEXT_EXT_HEADING_EVENTS_INFO) ?>

<?php echo form_tag('events', url_for('ext/calendar/public','action=save' . (isset($_GET['id']) ? '&id=' . $_GET['id'] : '')),array('class'=>'form-horizontal')) ?>
    
<div class="modal-body">    
  <div class="form-body">
  
<ul class="nav nav-tabs">
  <li class="active"><a href="#general_info"  data-toggle="tab"><?php echo TEXT_GENERAL_INFO ?></a></li>  
  <li><a href="#repeat"  data-toggle="tab"><?php echo TEXT_EXT_REPEAT_EVENTS ?></a></li>    
</ul>  

<div class="tab-content">
  <div class="tab-pane fade active in" id="general_info">
    
    <div class="form-group">
    	<label class="col-md-3 control-label" for="name"><?php echo TEXT_EXT_EVENT_NAME ?></label>
      <div class="col-md-9">	
    	  <?php echo input_tag('name',$obj['name'],array('class'=>'form-control input-large required')) ?>        
      </div>			
    </div>
    
    <div class="form-group">
    	<label class="col-md-3 control-label" for="description"><?php echo TEXT_DESCRIPTION ?></label>
      <div class="col-md-9">	
    	  <?php echo textarea_tag('description',$obj['description'],array('class'=>'form-control')) ?>        
      </div>			
    </div>
    
    <div class="form-group">
    	<label class="col-md-3 control-label" for="start_date"><?php echo TEXT_EXT_EVENT_START_DATE ?></label>
      <div class="col-md-9">    
        <div class="input-group input-medium date datetimepicker-field"> 
          <?php echo input_tag('start_date',$obj['start_date'],array('class'=>'form-control required')) ?> 
          <span class="input-group-btn">
            <button class="btn btn-default date-set" type="button"><i class="fa fa-calendar"></i></button>
          </span>
        </div>        
      </div>			
    </div>
    
    <div class="form-group">
    	<label class="col-md-3 control-label" for="end_date"><?php echo TEXT_EXT_EVENT_END_DATE ?></label>
      <div class="col-md-9">    
        <div class="input-group input-medium date datetimepicker-field"> 
          <?php echo input_tag('end_date',$obj['end_date'],array('class'=>'form-control required')) ?> 
          <span class="input-group-btn">
            <button class="btn btn-default date-set" type="button"><i class="fa fa-calendar"></i></button>
          </span>
        </div>        
      </div>			
    </div> 
    
    <div class="form-group">
    	<label class="col-md-3 control-label" for="bg_color"><?php echo TEXT_BACKGROUND_COLOR ?></label>
      <div class="col-md-9">	
    	  <?php echo '<div class="color-picker-box" data-color="' . $obj['bg_color'] . '">' . input_hidden_tag('bg_color',$obj['bg_color']) . '</div>' ?> 
      </div>			
    </div>
    
   </div>
   <div class="tab-pane fade" id="repeat">
    
    <div class="form-group">
    	<label class="col-md-3 control-label" for="repeat_type"><?php echo TEXT_EXT_EVENT_REPEAT_TYPE ?></label>
      <div class="col-md-9">	
    	  <?php echo select_tag('repeat_type',calendar::get_events_repeat_types(),$obj['repeat_type'],array('class'=>'form-control input-medium','onChange'=>'display_repeat_days_by_type()')) ?>        
      </div>			
    </div>
    
    <div class="form-group">
    	<label class="col-md-3 control-label" for="repeat_interval"><?php echo TEXT_EXT_EVENT_REPEAT_INTERVAL ?></label>
      <div class="col-md-9">	
    	  <?php echo input_tag('repeat_interval',$obj['repeat_interval'],array('class'=>'form-control input-xsmall')) ?>        
      </div>			
    </div>
    
    <div class="form-group" id="repeat-days-form-group" style="display:none">
    	<label class="col-md-3 control-label" for="repeat_days"><?php echo TEXT_EXT_EVENT_REPEAT_DAYS ?></label>
      <div class="col-md-9">	
    	  <?php echo select_checkboxes_tag('repeat_days',calendar::get_events_repeat_days(),$obj['repeat_days'],array('class'=>'form-control')) ?>        
      </div>			
    </div>
    
    <div class="form-group">
    	<label class="col-md-3 control-label" for="repeat_end"><?php echo TEXT_EXT_EVENT_REPEAT_END ?></label>
      <div class="col-md-9">    
        <div class="input-group input-medium date datepicker"> 
          <?php echo input_tag('repeat_end',$obj['repeat_end'],array('class'=>'form-control')) ?> 
          <span class="input-group-btn">
            <button class="btn btn-default date-set" type="button"><i class="fa fa-calendar"></i></button>
          </span>
        </div>        
      </div>			
    </div> 
    
    <div class="form-group">
    	<label class="col-md-3 control-label" for="repeat_limit"><?php echo TEXT_EXT_EVENT_REPEAT_LIMIT ?></label>
      <div class="col-md-9">	
    	  <?php echo input_tag('repeat_limit',$obj['repeat_limit'],array('class'=>'form-control input-xsmall')) ?>        
      </div>			
    </div>
    
            
   
   </div>
</div> 
                         
  </div>  
</div> 
 
<?php echo ajax_modal_template_footer(false,(isset($_GET['id']) ? '<a href="javascript: delete_event(' . $_GET['id'] . ');" title="' . TEXT_EXT_DELETE_EVENT . '" class="btn btn-default"><i class="fa fa-trash-o"></i></a>':'')) ?>

</form> 

<script>

  $(function() { 
  
    display_repeat_days_by_type();
    
    $('.color-picker-box').izoColorPicker();
        
    $('#events').validate({
      submitHandler: function(form)
      {
        app_prepare_modal_action_loading()
        
        $.ajax({type: "POST",
          url: '<?php echo url_for("ext/calendar/public","action=save" . (isset($_GET["id"]) ? "&id=" . $_GET["id"] : ''))?>',
          data: $('#events').serializeArray() 
          }).done(function() {
            $('#ajax-modal').modal('hide')
            calendar_public.refetchEvents()
          });                    
      }
    });                                                                            
  });
  
  function delete_event(id)
  {
    if(confirm('<?php echo TEXT_EXT_DELETE_EVENT_CONFIRM ?>'))
    {
      $.ajax({type: "POST",
          url: '<?php echo url_for("ext/calendar/public","action=delete")?>',
          data: {id:id} 
          }).done(function() {
            $('#ajax-modal').modal('hide')
            calendar_public.refetchEvents()
          }); 
    }
  }
  
  function display_repeat_days_by_type()
  {
    if($('#repeat_type').val()=='weekly')
    {
      $('#repeat-days-form-group').fadeIn();
    }
    else
    {
      $('#repeat-days-form-group').fadeOut();
    }
  }
      
</script>  