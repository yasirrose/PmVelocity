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

<h3 class="page-title"><?php echo  TEXT_RECORDS_VISIBILITY ?></h3>

<p><?php echo TEXT_RECORDS_VISIBILITY_INFO ?></p>

<?php echo button_tag(TEXT_ADD_RULE,url_for('records_visibility/form','entities_id=' . $_GET['entities_id']),true,array('class'=>'btn btn-primary'))  ?>

<div class="table-scrollable">
<table class="table table-striped table-bordered table-hover">
<thead>
  <tr>
    
    <th><?php echo TEXT_ACTION?></th>
    <th><?php echo TEXT_ID ?></th>
    <th><?php echo TEXT_IS_ACTIVE ?></th>    
    <th width="100%"><?php echo TEXT_USERS_GROUPS ?></th>    
    <th><?php echo TEXT_FILTERS ?></th>
    <th><?php echo TEXT_LINKED_ENTITIES ?></th>
    <th><?php echo TEXT_NOTE ?></th>
               
  </tr>
</thead>
<tbody>
<?php

$rules_query = db_query("select * from app_records_visibility_rules where entities_id='" . _get::int('entities_id'). "' order by users_groups");

if(db_num_rows($rules_query)==0) echo '<tr><td colspan="9">' . TEXT_NO_RECORDS_FOUND. '</td></tr>';

$merget_fields_choices = records_visibility::merget_fields_choices(_get::int('entities_id'));

while($rules = db_fetch_array($rules_query)):
?>
<tr>  
  <td style="white-space: nowrap;"><?php echo button_icon_delete(url_for('records_visibility/delete','id=' . $rules['id'] . '&entities_id=' . $_GET['entities_id'])) . ' ' . button_icon_edit(url_for('records_visibility/form','id=' . $rules['id']. '&entities_id=' . $_GET['entities_id'])) ?></td>
  <td><?php echo $rules['id'] ?></td>
  <td><?php echo render_bool_value($rules['is_active']) ?></td>
  <td><?php echo implode('<br>',access_groups::get_name_by_id_list($rules['users_groups'])) ?></td>     
  <td><?php echo '<a href="' . url_for('records_visibility/filters','rules_id=' . $rules['id'] . '&entities_id=' . _get::int('entities_id')) . '">' . TEXT_FILTERS . ' (' . records_visibility::count_filters($rules['id']). ')</a>' ?></td>
  <td>
  	<?php
  	if(strlen($rules['merged_fields']))
  	{
  		foreach(explode(',',$rules['merged_fields']) as $merged_fields)
  		{
  			if(isset($merget_fields_choices[$merged_fields]))
  			{
  				echo $merget_fields_choices[$merged_fields] . '<br>';
  			}
  		}
  	}
  	
  	if(strlen($rules['merged_fields_empty_values']))
  	{
  	    $empty_values = [];
  	    foreach(explode(',',$rules['merged_fields_empty_values']) as $fields_id)
  	    {
  	        $empty_values[] = ' - ' . $app_entities_cache[$rules['entities_id']]['name'] . ': ' . fields::get_name_by_id($fields_id);
  	    }
  	    
  	    if(count($empty_values))
  	    {
  	        echo '<div style="padding-top: 5px;">' . TEXT_CONDITION_EMPTY_VALUE . ':<br>' . implode('<br>', $empty_values) . '</div>';
  	    }
  	}
  	?>
  </td>
  <td><?php echo tooltip_icon($rules['notes'],'left') ?></td>
</tr>  
<?php endwhile ?>
</tbody>
</table>
</div>