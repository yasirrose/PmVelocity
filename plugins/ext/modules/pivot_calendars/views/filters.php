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

$entity_info = db_find('app_entities',$current_reports_info['entities_id']);

$breadcrumb = array();

$breadcrumb[] = '<li>' . link_to(TEXT_EXT_PIVOT_СALENDAR,url_for('ext/pivot_calendars/reports')) . '<i class="fa fa-angle-right"></i></li>';

$breadcrumb[] = '<li>' . $pivot_calendar_info['name'] . '<i class="fa fa-angle-right"></i></li>';

$breadcrumb[] = '<li>' . link_to($entity_info['name'],url_for('ext/pivot_calendars/entities','calendars_id=' . $pivot_calendar_info['id'])) . '<i class="fa fa-angle-right"></i></li>';

$breadcrumb[] = '<li>' . TEXT_FILTERS . '</li>';
?>

<ul class="page-breadcrumb breadcrumb">
  <?php echo implode('',$breadcrumb) ?>  
</ul>

<?php 

$reports_list[] = $current_reports_info['id'];
$reports_list = reports::get_parent_reports($current_reports_info['id'],$reports_list);

foreach($reports_list as $reports_id)
{

$report_info = db_find('app_reports',$reports_id);
$entity_info = db_find('app_entities',$report_info['entities_id']);

$parent_reports_param = '';
if($current_reports_info['id']!=$reports_id)
{
  $parent_reports_param = '&parent_reports_id=' . $reports_id;    
}
?>

<div class="panel panel-default">
  <div class="panel-heading"><?php echo TEXT_FILTERS_FOR_ENTITY . ': <b>' . $entity_info['name'] . '</b>' ?></div>
    <div class="panel-body"> 

    <?php echo button_tag(TEXT_BUTTON_ADD_NEW_REPORT_FILTER,url_for('ext/pivot_calendars/filters_form','calendars_id=' . $pivot_calendar_info['id'] . '&reports_id=' . $current_reports_info['id'] . $parent_reports_param)) ?>
    
    <div class="table-scrollable">
    <table class="table table-striped table-bordered table-hover">
    <thead>
      <tr>
        <th><?php echo TEXT_ACTION ?></th>        
        <th width="100%"><?php echo TEXT_FIELD ?></th>
        <th><?php echo TEXT_FILTERS_CONDITION ?></th>
        <th><?php echo TEXT_VALUES ?></th>
                
      </tr>
    </thead>
    <tbody>
    <?php if(db_count('app_reports_filters',$reports_id,'reports_id')==0) echo '<tr><td colspan="5">' . TEXT_NO_RECORDS_FOUND. '</td></tr>'; ?>
    <?php  
      $filters_query = db_query("select rf.*, f.name, f.type from app_reports_filters rf left join app_fields f on rf.fields_id=f.id where rf.reports_id='" . db_input($reports_id) . "' order by rf.id");
      while($v = db_fetch_array($filters_query)):            
    ?>
      <tr>
        <td style="white-space: nowrap;"><?php echo button_icon_delete(url_for('ext/pivot_calendars/filters_delete','calendars_id=' . $pivot_calendar_info['id'] . '&id=' . $v['id'] . '&reports_id=' . $current_reports_info['id'] . $parent_reports_param)) . ' ' . button_icon_edit(url_for('ext/pivot_calendars/filters_form','calendars_id=' . $pivot_calendar_info['id'] . '&id=' . $v['id'] . '&reports_id=' . $current_reports_info['id'] . $parent_reports_param))  ?></td>    
        <td><?php echo fields_types::get_option($v['type'],'name',$v['name']) ?></td>
        <td><?php echo reports::get_condition_name_by_key($v['filters_condition']) ?></td>
        <td class="nowrap"><?php echo reports::render_filters_values($v['fields_id'],$v['filters_values'],'<br>',$v['filters_condition']) ?></td>            
      </tr>
    <?php endwhile?>  
    </tbody>
    </table>
    </div>
    
  </div>
</div>  
  
<?php } ?>

<?php echo '<a class="btn btn-default" href="' . url_for('ext/pivot_calendars/entities','calendars_id=' . $pivot_calendar_info['id']) . '">' . TEXT_BUTTON_BACK. '</a>'; ?>  
  

