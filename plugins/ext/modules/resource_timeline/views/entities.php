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

$breadcrumb = array();

$breadcrumb[] = '<li>' . link_to(TEXT_EXT_RESOURCE_TIMELINE,url_for('ext/resource_timeline/reports')) . '<i class="fa fa-angle-right"></i></li>';

$breadcrumb[] = '<li>' . $calendar_info['name'] . '</li>';
?>

<ul class="page-breadcrumb breadcrumb">
  <?php echo implode('',$breadcrumb) ?>  
</ul>

<h3 class="page-title"><?php echo TEXT_EXT_ENTITIES ?></h3>

<p><?php echo TEXT_EXT_PIVOT_СALENDAR_ENTITIES_INFO ?></p>

<?php echo button_tag(TEXT_BUTTON_ADD,url_for('ext/resource_timeline/entities_form','calendars_id=' . $calendar_info['id']),true) ?>

<div class="table-scrollable">
<table class="table table-striped table-bordered table-hover">
<thead>
  <tr>
    <th><?php echo TEXT_ACTION ?></th>            
    <th width="100%"><?php echo TEXT_ENTITY ?></th>
    <th><?php echo TEXT_BACKGROUND_COLOR ?></th>        
    <th><?php echo TEXT_EXT_СALENDAR_START_DATE ?></th>    
    <th><?php echo TEXT_EXT_СALENDAR_END_DATE ?></th>    
  </tr>
</thead>
<tbody>
<?php
$items_query = db_query("select ce.*, e.name from app_ext_resource_timeline_entities ce, app_entities e where e.id=ce.entities_id and ce.calendars_id='" . $calendar_info['id'] . "' order by e.name");

if(db_num_rows($items_query)==0) echo '<tr><td colspan="9">' . TEXT_NO_RECORDS_FOUND. '</td></tr>';

$fields_cahce = fields::get_name_cache();

while($items = db_fetch_array($items_query)):
    
    $filters_panel_type = 'resource_timeline_entity_filters_panel_' . $calendar_info['id'] . '_' . $items['entities_id'];
    $filters_panel_id = filters_panels::get_id_by_type($items['entities_id'], $filters_panel_type);
    $filters_panel_link = '<a href="' . url_for('ext/filters_panels/fields','panels_id=' . $filters_panel_id . '&entities_id=' . $items['entities_id'] . '&redirect_to=resource_entity_timeline' . $calendar_info['id'] . '_' . $items['entities_id']) . '">' . TEXT_FILTERS_PANELS . '</a>';

?>
<tr>
  <td style="white-space: nowrap;"><?php echo button_icon_delete(url_for('ext/resource_timeline/entities_delete','id=' . $items['id'] . '&calendars_id=' . $calendar_info['id'])) . ' ' . button_icon_edit(url_for('ext/resource_timeline/entities_form','id=' . $items['id'] . '&calendars_id=' . $calendar_info['id'])) ?></td>  
  <td><?php echo link_to($items['name'],url_for('default_filters/filters','reports_id=' . default_filters::get_reports_id($items['entities_id'], 'resource_timeline_entities' . $items['id']) . '&redirect_to=resource_timeline_entities'. $items['id']))  . 
          '<br>' . tooltip_text(TEXT_FILTERS . ': ' . reports::count_filters_by_reports_type($items['entities_id'],'resource_timeline_entities' . $items['id']) . ' | ' . $filters_panel_link) ?></td>
  <td><?php echo render_bg_color_block($items['bg_color']) ?></td>   
  <td><?php echo $fields_cahce[$items['start_date']] ?></td>
  <td><?php echo $fields_cahce[$items['end_date']] ?></td>    
</tr>  
<?php endwhile ?>
</tbody>
</table>
</div>

<?php echo '<a href="' . url_for('ext/resource_timeline/reports') . '" class="btn btn-default">' . TEXT_BUTTON_BACK. '</a>' ?>