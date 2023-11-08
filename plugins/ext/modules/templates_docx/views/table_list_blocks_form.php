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

<?php echo form_tag('templates_form', url_for('ext/templates_docx/table_list_blocks','templates_id=' . _GET('templates_id') . '&action=save' . (isset($_GET['id']) ? '&id=' . $_GET['id']:'')  . '&parent_block_id=' . $parent_block['id']),array('class'=>'form-horizontal')) ?>

<div class="modal-body">
  <div class="form-body">
  
<?php

$cfg = new fields_types_cfg($parent_block['field_configuration']);

//print_rr($parent_block);

$settings = new settings($obj['settings']);

?>  

<ul class="nav nav-tabs">
  <li class="active"><a href="#tab_value" data-toggle="tab"><?php echo TEXT_VALUE ?></a></li>   
  <li><a href="#tab_heading"  data-toggle="tab"><?php echo TEXT_HEADING ?></a></li>      
</ul>

<div class="tab-content">
  <div class="tab-pane fade active in" id="tab_value"> 
             
      <div class="form-group">
      	<label class="col-md-3 control-label" for="fields_id"><?php echo TEXT_SORT_ORDER ?></label>
        <div class="col-md-9"><?php echo input_tag('sort_order',$obj['sort_order'],['class'=>'form-control input-xsmall']) ?></div>			
      </div>
      
<?php 

switch($parent_block['field_type'])
{
    case 'fieldtype_entity':
    case 'fieldtype_entity_ajax':
    case 'fieldtype_entity_multilevel':
    case 'fieldtype_related_records':
        $field_entity_id = $cfg->get('entity_id');
        break;
    default:
        $field_entity_id = 1;
        break;
}

if($parent_block['field_type']=='fieldtype_id' and $app_entities_cache[$parent_block['entities_id']]['parent_id']==$template_info['entities_id'])
{
    $field_entity_id = $parent_block['entities_id'];
}

$choices = [];
$fields_query = fields::get_query($field_entity_id,"and f.type not in ('fieldtype_action')");
while($v = db_fetch_array($fields_query))
{
    $choices[$v['id']] = strip_tags(fields_types::get_option($v['type'],'name',$v['name'])) . ' (#' . $v['id'] . ')';
}
?>      
      
      <div class="form-group">
      	<label class="col-md-3 control-label" for="fields_id"><?php echo TEXT_FIELDS ?></label>
        <div class="col-md-9"><?php echo select_tag('settings[fields][]',$choices,$settings->get('fields'),array('class'=>'form-control input-xlarge chosen-select chosen-sortable required','multiple'=>'multiple','chosen_order'=>(is_array($settings->get('fields')) ? implode(',',$settings->get('fields')) : '') )) ?>
        </div>			
      </div>
      
      <div class="form-group settings-list" form_display_rules="settings_display_field_names:1">
        <label class="col-md-3 control-label" for="fields_id"><?php echo TEXT_EXT_COLUMN_WIDTH . ' (' . TEXT_VALUE . ')' ?></label>
        <div class="col-md-9"><?php echo input_tag('settings[value_column_width]',$settings->get('value_column_width',''),['class'=>'form-control input-small number']) ?></div>			
      </div>
      
      <div class="form-group" id="is-heading-container">
       	<label class="col-md-3 control-label" for="display_field_names"><?php echo TEXT_DISPLAY_FIELD_NAMES ?></label>
        <div class="col-md-9">	
      	  <div class="checkbox-list"><label class="checkbox-inline"><?php echo select_tag('settings[display_field_names]',['1'=>TEXT_YES,'0'=>TEXT_NO],$settings->get('display_field_names',1),['class'=>'form-control input-small']) ?></label></div>        
        </div>			
      </div> 
      
      <div class="form-group settings-list" form_display_rules="settings_display_field_names:1">
        <label class="col-md-3 control-label" for="fields_id"><?php echo TEXT_EXT_COLUMN_WIDTH . ' (' . TEXT_TITLE . ')' ?></label>
        <div class="col-md-9"><?php echo input_tag('settings[field_name_column_width]',$settings->get('field_name_column_width',''),['class'=>'form-control input-small number']) ?></div>			
      </div>
      
      <div class="form-group settings-list">
        <label class="col-md-3 control-label" for="fields_id"><?php echo TEXT_EXT_FONT_SIZE ?></label>
        <div class="col-md-9"><?php echo input_tag('settings[content_font_size]',$settings->get('content_font_size',''),['class'=>'form-control input-small number']) ?></div>			
      </div>
      
<?php 
$font_style_choices = [
    'bold' => '<i class="fa fa-bold" aria-hidden="true"></i>',
    'italic' => '<i class="fa fa-italic" aria-hidden="true"></i>',
    'underline' => '<i class="fa fa-underline" aria-hidden="true"></i>',
];
?>        
       
      <div class="form-group settings-list">
        <label class="col-md-3 control-label" for="fields_id"><?php echo TEXT_EXT_FONT_STYLE ?></label>
        <div class="col-md-9"><?php echo select_checkboxes_button('settings[content_font_style]',$font_style_choices,$settings->get('content_font_style','')) ?></div>			
      </div>
      
<?php 
$alignment_choices = [
    'left' => '<i class="fa fa-align-left" aria-hidden="true"></i>',
    'center' => '<i class="fa fa-align-center" aria-hidden="true"></i>',
    'right' => '<i class="fa fa-align-right" aria-hidden="true"></i>',
];


?>       
     
      <div class="form-group settings-list">
        <label class="col-md-3 control-label" for="fields_id"><?php echo TEXT_EXT_ALIGNMENT ?></label>
        <div class="col-md-9"><?php echo select_radioboxes_button('settings[content_alignment]',$alignment_choices,$settings->get('content_alignment','left')) ?></div>			
      </div>  
      
    <h3 class="form-section"><?php echo TEXT_TABLE ?></h3>  
    
      <div class="form-group settings-table">
        <label class="col-md-3 control-label" for="fields_id"><?php echo TEXT_EXT_BORDER  ?></label>
        <div class="col-md-2"><?php echo select_tag('settings[border]',[''=>'','table'=>TEXT_TABLE,'row'=>TEXT_ROW],$settings->get('border'),['class'=>'form-control input-small ']) ?></div>        
        <div class="col-md-3"><?php echo input_color('settings[border_color]',$settings->get('border_color')) ?></div>
      </div>      
      <div class="form-group settings-table">
        <label class="col-md-3 control-label" for="fields_id"><?php echo TEXT_EXT_CELL_MARGIN  ?></label>
        <div class="col-md-9"><?php echo input_tag('settings[cell_margin]',$settings->get('cell_margin','0'),['class'=>'form-control input-xsmall required number'])  ?></div>			
      </div>      
    
  </div>
  
  <div class="tab-pane fade" id="tab_heading">
      <div class="form-group">
      	<label class="col-md-3 control-label" for="fields_id"><?php echo TEXT_HEADING ?></label>
        <div class="col-md-9"><?php echo input_tag('settings[heading]',$settings->get('heading'),['class'=>'form-control input-large']) ?></div>			
      </div>
      
      <div class="form-group settings-list">
        <label class="col-md-3 control-label" for="fields_id"><?php echo TEXT_WIDHT ?></label>
        <div class="col-md-9"><?php echo input_tag('settings[cell_width]',$settings->get('cell_width',''),['class'=>'form-control input-small number']) ?></div>			
      </div>
      
      <div class="form-group settings-list">
        <label class="col-md-3 control-label" for="fields_id"><?php echo TEXT_EXT_FONT_SIZE ?></label>
        <div class="col-md-9"><?php echo input_tag('settings[heading_font_size]',$settings->get('heading_font_size',''),['class'=>'form-control input-small number']) ?></div>			
      </div>
     
      <div class="form-group settings-list">
        <label class="col-md-3 control-label" for="fields_id"><?php echo TEXT_EXT_FONT_STYLE ?></label>
        <div class="col-md-9"><?php echo select_checkboxes_button('settings[heading_font_style]',$font_style_choices,$settings->get('heading_font_style','')) ?></div>			
      </div>
      
     
      <div class="form-group settings-list">
        <label class="col-md-3 control-label" for="fields_id"><?php echo TEXT_EXT_ALIGNMENT ?></label>
        <div class="col-md-9"><?php echo select_radioboxes_button('settings[heading_alignment]',$alignment_choices,$settings->get('heading_alignment','left')) ?></div>			
      </div>  
      
<?php 
$direction_choices = [
    '' => '<i class="fa fa-long-arrow-right" aria-hidden="true"></i>',
    'BTLR' => '<i class="fa fa-long-arrow-up" aria-hidden="true"></i>',
    'TBRL' => '<i class="fa fa-long-arrow-down" aria-hidden="true"></i>',
];
?>      
      <div class="form-group settings-list">
        <label class="col-md-3 control-label" for="fields_id"><?php echo TEXT_EXT_TEXT_DIRECTION ?></label>
        <div class="col-md-9"><?php echo select_radioboxes_button('settings[heading_text_direction]',$direction_choices,$settings->get('heading_text_direction','')) ?></div>			
      </div>
      
  </div>

</div> 
  
  
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
  });
</script>