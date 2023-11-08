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

<?php echo ajax_modal_template_header(TEXT_EXT_PIVOT_СALENDAR) ?>

<?php echo form_tag('configuration_form', url_for('ext/resource_timeline/reports', 'action=save' . (isset($_GET['id']) ? '&id=' . $_GET['id'] : '')), array('class' => 'form-horizontal')) ?>
<div class="modal-body">
    <div class="form-body ajax-modal-width-790">


        <ul class="nav nav-tabs">
            <li class="active"><a href="#general_info"  data-toggle="tab"><?php echo TEXT_GENERAL_INFO ?></a></li>  
            <li><a href="#fields"  data-toggle="tab"><?php echo TEXT_FIELDS ?></a></li>  
            <li><a href="#extra"  data-toggle="tab"><?php echo TEXT_EXTRA ?></a></li>
            <li><a href="#access"  data-toggle="tab"><?php echo TEXT_ACCESS ?></a></li>    
        </ul>

        <div class="tab-content">
            <div class="tab-pane fade active in" id="general_info">


                <div class="form-group">
                    <label class="col-md-3 control-label" for="name"><?php echo TEXT_NAME ?></label>
                    <div class="col-md-9">	
                        <?php echo input_tag('name', $obj['name'], array('class' => 'form-control input-large required')) ?>        
                    </div>			
                </div>
                
                <div class="form-group">
                    <label class="col-md-3 control-label" for="type"><?php echo TEXT_ENTITY . ' (' . TEXT_EXT_RESOURCE . ')' ?></label>
                    <div class="col-md-9">	
                        <?php echo select_tag('entities_id', entities::get_choices(), $obj['entities_id'], array('class' => 'form-control input-large required')) ?>        
                    </div>			
                </div>
                
                

                <div class="form-group">
                    <label class="col-md-3 control-label" for="in_menu"><?php echo tooltip_icon(TEXT_EXT_DISPLYA_IN_MAIN_MENU_TIP) . TEXT_EXT_DISPLYA_IN_MAIN_MENU ?></label>
                    <div class="col-md-9">	
                        <div class="checkbox-list"><label class="checkbox-inline"><?php echo input_checkbox_tag('in_menu', '1', array('checked' => $obj['in_menu'])) ?></label></div>
                    </div>			
                </div> 

                <div class="form-group">
                    <label class="col-md-3 control-label" for="name"><?php echo TEXT_SORT_ORDER ?></label>
                    <div class="col-md-9">	
                        <?php echo input_tag('sort_order', $obj['sort_order'], array('class' => 'form-control input-small')) ?>        
                    </div>			
                </div>

            </div>
            
            <div class="tab-pane fade" id="fields">
                <div id="reports_entities_fields"></div>
            </div>
            
            <div class="tab-pane fade" id="extra">
                
                <div class="form-group">
                    <label class="col-md-4 control-label" for="display_legend"><?php echo tooltip_icon(TEXT_EXT_PIVOT_CALENDAR_DISPLAY_LEGEND_TIP) . TEXT_EXT_DISPLAY_LEGEND ?></label>
                    <div class="col-md-8">	
                        <div class="checkbox-list"><label class="checkbox-inline"><?php echo input_checkbox_tag('display_legend', '1', array('checked' => $obj['display_legend'])) ?></label></div>
                    </div>			
                </div>
                
                <div class="form-group">
                    <label class="col-md-4 control-label" for="default_view"><?php echo TEXT_EXT_DEFAULT_VIEW ?></label>
                    <div class="col-md-8">	
                        <?php echo select_tag('default_view', resource_timeline::get_default_view_choices(), $obj['default_view'], array('class' => 'form-control input-medium')) ?>        
                    </div>			
                </div>
                
                <div class="form-group" form_display_rules="default_view: timelineDay,agendaDay">
                    <label class="col-md-4 control-label" for=""><?php echo tooltip_icon(TEXT_EXT_CALENDAR_WORK_HOURS_TIP) . TEXT_EXT_WORK_HOURS ?></label>
                    <div class="col-md-8">	
                        <div class="input-group input-medium">					
                            <span class="input-group-addon">
                                <i class="fa fa-calendar"></i>
                            </span>
                            <?php echo input_tag('min_time', $obj['min_time'], array('class' => 'form-control datetimepicker-timeonly daterange-date-field', 'autocomplete' => 'off', 'data-minute-step' => 30, 'placeholder' => TEXT_DATE_FROM)) ?>
                            <span class="input-group-addon">
                                <i style="cursor:pointer" class="fa fa-refresh" aria-hidden="true" title="<?php echo TEXT_EXT_RESET ?>" onClick="$('.daterange-date-field').val('')"></i>
                            </span>
                            <?php echo input_tag('max_time', $obj['max_time'], array('class' => 'form-control datetimepicker-timeonly daterange-date-field', 'autocomplete' => 'off', 'placeholder' => TEXT_DATE_TO)) ?>			
                        </div>		
                    </div>	    		
                </div> 
                
<script>
$(".datetimepicker-timeonly").datetimepicker({
	  autoclose: true,
	  isRTL: App.isRTL(),
	  format: 'hh:ii',
	  startView: 1,	   
	  minuteStep: 30,
	  clearBtn: true,
});
</script>                

                <div class="form-group">
                    <label class="col-md-4 control-label" for="view_modes"><?php echo  TEXT_EXT_CALENDAR_USE_VIEW ?></label>
                    <div class="col-md-8">	
                        <?php echo select_tag('view_modes[]', resource_timeline::get_default_view_choices(), $obj['view_modes'], array('class' => 'form-control input-large chosen-select chosen-sortable', 'multiple' => 'multiple', 'chosen_order' => $obj['view_modes'])) ?>        
                    </div>			
                </div>
                
<?php 
	$choices = [];
	$choices['00:05:00'] = '00:05';
	$choices['00:10:00'] = '00:10';
	$choices['00:15:00'] = '00:15';
	$choices['00:30:00'] = '00:30';
?>
                <div class="form-group">
                    <label class="col-md-4 control-label" for="time_slot_duration"><?php echo TEXT_EXT_TIME_SLOT_DURATION ?></label>
                    <div class="col-md-8">	
                        <?php echo select_tag('time_slot_duration', $choices, $obj['time_slot_duration'], array('class' => 'form-control input-small')) ?>        
                    </div>			
                </div>  
                
            </div>

            <div class="tab-pane fade" id="access">
                <p><?php echo TEXT_EXT_USERS_GROUPS_INFO ?></p>

                <?php
                $users_groups = strlen($obj['users_groups']) ? json_decode($obj['users_groups'], true) : array();
                foreach (access_groups::get_choices(false) as $group_id => $group_name):
                    ?>
                    <div class="form-group">
                        <label class="col-md-3 control-label" for="allowed_groups"><?php echo $group_name ?></label>
                        <div class="col-md-9">	
                            <?php echo select_tag('access[' . $group_id . ']', array('' => '', 'view' => TEXT_VIEW_ONLY_ACCESS, 'full' => TEXT_FULL_ACCESS), (isset($users_groups[$group_id]) ? $users_groups[$group_id] : ''), array('class' => 'form-control input-medium')) ?>
                        </div>			
                    </div>
                <?php endforeach ?>

            </div>  
        </div>



    </div>
</div> 

<?php echo ajax_modal_template_footer() ?>

</form> 

<script>
    $(function ()
    {
        $('#configuration_form').validate({ignore: '',
            submitHandler: function (form)
            {
                app_prepare_modal_action_loading(form)
                return true;
            }
        });
        
        ext_get_entities_fields($('#entities_id').val());
        
        $('#entities_id').change(function(){
            ext_get_entities_fields($(this).val())
        })

    });
          
function ext_get_entities_fields(entities_id)
{ 
  $('#reports_entities_fields').html('<div class="ajax-loading"></div>');
   
  $('#reports_entities_fields').load('<?php echo url_for("ext/resource_timeline/reports","action=get_entities_fields")?>',{entities_id:entities_id, id:'<?php echo $obj["id"] ?>'},function(response, status, xhr) {
    if (status == "error") {                                 
       $(this).html('<div class="alert alert-error"><b>Error:</b> ' + xhr.status + ' ' + xhr.statusText+'<div>'+response +'</div></div>')                    
    }
    else
    {
      appHandleUniform();
    }    
  }); 
     
}   

  
</script>  
</script>   