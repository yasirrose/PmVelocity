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

<h3 class="page-title"><?php echo TEXT_EXT_COMMENTS_TEMPLATES ?></h3>

<ul class="page-breadcrumb breadcrumb">
  <li><?php echo link_to(TEXT_EXT_COMMENTS_TEMPLATES,url_for('ext/templates/comments_templates'))?><i class="fa fa-angle-right"></i></li>
  <li><?php echo $template_info['entities_name'] ?><i class="fa fa-angle-right"></i></li>
  <li><?php echo $template_info['name'] ?></li>
</ul>

<?php echo button_tag(TEXT_BUTTON_ADD_NEW_FIELD,url_for('ext/templates/comments_templates_fields_form','templates_id=' . $template_info['id']),true) ?>

<div class="table-scrollable">
<table class="table table-striped table-bordered table-hover">
<thead>
  <tr>
    <th width="80"><?php echo TEXT_ACTION ?></th>          
    <th><?php echo TEXT_NAME ?></th>    
    <th><?php echo TEXT_VALUES ?></th>            
  </tr>
</thead>
<tbody>
<?php

$templates_fields_query = db_query("select tf.id, tf.fields_id, tf.value, f.name from app_ext_comments_templates_fields tf, app_fields f left join app_forms_tabs t on f.forms_tabs_id=t.id  where f.id=tf.fields_id and tf.templates_id='" . db_input($template_info['id']) ."' order by t.sort_order, t.name, f.sort_order, f.name");

if(db_num_rows($templates_fields_query)==0) echo '<tr><td colspan="5">' . TEXT_NO_RECORDS_FOUND. '</td></tr>'; 

while($templates_fields = db_fetch_array($templates_fields_query)):

$field = db_find('app_fields',$templates_fields['fields_id']);

$output_options = array('class'=>$field['type'],
                        'value'=>$templates_fields['value'],
                        'field'=>$field,                        
                        'is_listing'=>true,                        
                        );
                        
?>
<tr>
  <td style="white-space: nowrap;"><?php echo button_icon_delete(url_for('ext/templates/comments_templates_fields_delete_confirm','id=' . $templates_fields['id'])) . ' ' . button_icon_edit(url_for('ext/templates/comments_templates_fields_form','templates_id=' . $template_info['id'] . '&id=' . $templates_fields['id'])) ?></td>
  <td><?php echo $templates_fields['name'] ?></td>  
  <td ><?php echo fields_types::output($output_options) ?></td>    
</tr>  
<?php endwhile ?>
</tbody>
</table>
</div>