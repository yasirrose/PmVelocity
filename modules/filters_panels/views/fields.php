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

<?php require(component_path('entities/navigation')) ?>

<h3 class="page-title"><?php echo  TEXT_FIELDS_CONFIGURATION . ' (' . TEXT_PANEL  . ' ' . $panels_id . ')'  ?></h3>

<p><?php echo TEXT_PANES_FILTERS_FIELDS_CONFIGURATION_INFO ?></p>

<?php echo button_tag(TEXT_BUTTON_ADD,url_for('filters_panels/fields_form','panels_id=' . $panels_id . '&entities_id=' . $_GET['entities_id'])) . ' ' .  button_tag(TEXT_BUTTON_SORT,url_for('filters_panels/fields_sort','entities_id=' . $_GET['entities_id'] . '&panels_id=' . $_GET['panels_id']),true,array('class'=>'btn btn-default'))  ?>

<div class="table-scrollable">
<table class="table table-striped table-bordered table-hover">
<thead>
  <tr>
    <th><?php echo TEXT_ACTION ?></th>            
    <th><?php echo TEXT_ENTITY ?></th>
    <th width="100%"><?php echo TEXT_FIELD ?></th>
    <th><?php echo TEXT_HEADING ?></th>                   
    <th><?php echo TEXT_DISPLAY_AS ?></th>    
  </tr>
</thead>
<tbody>
<?php

$fields_query = db_query("select pf.*, f.name as field_name, f.type as field_type, f.entities_id as field_entity_id from app_filters_panels_fields pf, app_fields f where pf.fields_id=f.id and pf.panels_id='" . _get::int('panels_id') . "' order by pf.sort_order");

if(db_num_rows($fields_query)==0) echo '<tr><td colspan="9">' . TEXT_NO_RECORDS_FOUND. '</td></tr>'; 

while($fields = db_fetch_array($fields_query)):
?>
<tr>
  <td style="white-space: nowrap;"><?php echo button_icon_delete(url_for('filters_panels/fields_delete','panels_id=' . $panels_id . '&id=' . $fields['id'] . '&entities_id=' . $_GET['entities_id'])) . ' ' . button_icon_edit(url_for('filters_panels/fields_form','panels_id=' . $panels_id . '&id=' . $fields['id']. '&entities_id=' . $_GET['entities_id'])) ?></td>
  <td><?php echo $app_entities_cache[$fields['field_entity_id']]['name'] ?></td>    
  <td><?php echo fields_types::get_option($fields['field_type'],'name',$fields['field_name']) ?></td>
  <td><?php echo $fields['title'] ?></td>     
  <td><?php echo filters_panels::get_field_display_type_name($fields['display_type']) ?></td>  
</tr>  
<?php endwhile ?>
</tbody>
</table>
</div>

<?php echo link_to(TEXT_BUTTON_BACK, url_for('filters_panels/panels','entities_id=' . _get::int('entities_id')),array('class'=>'btn btn-default'))?>