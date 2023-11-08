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

<h3 class="page-title"><?php echo TEXT_EXT_MAP_REPORTS ?></h3>

<p><?php echo TEXT_EXT_MAP_REPORTS_INFO ?></p>

<?php echo button_tag(TEXT_BUTTON_CREATE,url_for('ext/map_reports/form')) ?>

<div class="table-scrollable">
<table class="table table-striped table-bordered table-hover">
<thead>
  <tr>
    <th><?php echo TEXT_ACTION ?></th>        
    <th><?php echo TEXT_REPORT_ENTITY ?></th>
    <th><?php echo TEXT_FIELD ?></th>
    <th width="100%"><?php echo TEXT_NAME ?></th>
    <th><?php echo TEXT_IN_MENU ?></th>            
    <th><?php echo TEXT_USERS_GROUPS ?></th>    
  </tr>
</thead>
<tbody>
<?php

$fields_cahce = fields::get_name_cache();

$reports_query = db_query("select * from app_ext_map_reports order by name");

if(db_num_rows($reports_query)==0) echo '<tr><td colspan="9">' . TEXT_NO_RECORDS_FOUND. '</td></tr>'; 

while($reports = db_fetch_array($reports_query)):
    
    $public_url = url_for('ext/map_reports/public','id=' . $reports['id']);
?>
<tr>
  <td style="white-space: nowrap;"><?php echo button_icon_delete(url_for('ext/map_reports/delete','id=' . $reports['id'])) . ' ' . button_icon_edit(url_for('ext/map_reports/form','id=' . $reports['id'])) ?></td>
  <td><?php echo $app_entities_cache[$reports['entities_id']]['name'] ?></td>
  <td><?php echo $app_fields_cache[$reports['entities_id']][$reports['fields_id']]['name'] ?></td>
  <td>
      <?php echo link_to($reports['name'], url_for('ext/map_reports/view','id=' . $reports['id'])) ?>
      <?php 
      
      $panels_id = filters_panels::get_id_by_type($reports['entities_id'], 'map_reports' . $reports['id']);
      
      echo '<br>&nbsp;&nbsp;<small>' . link_to(TEXT_FILTERS . ' (' . reports::count_filters_by_reports_type($reports['entities_id'], 'default_map_reports' . $reports['id']). ') ',url_for('default_filters/filters','reports_id=' . default_filters::get_reports_id($reports['entities_id'], 'default_map_reports' . $reports['id']) . '&redirect_to=public_map' . $reports['id']));
      echo '<small>&nbsp;|&nbsp; <a href="' . url_for('ext/filters_panels/fields','panels_id=' . $panels_id . '&entities_id=' . $reports['entities_id'] . '&redirect_to=map_reports' . $reports['id']) . '">' . TEXT_QUICK_FILTERS_PANELS . '</a></small></small>';
      
      if($reports['is_public_access'])
      {
          echo '<br>&nbsp;&nbsp;<small>' . TEXT_EXT_PUBLIC_URL . ': <a href="' . $public_url . '" target="_blank">' . TEXT_VIEW . '</a> | ' . link_to(TEXT_FILTERS . ' (' . reports::count_filters_by_reports_type($reports['entities_id'], 'public_map' . $reports['id']). ') ',url_for('default_filters/filters','reports_id=' . default_filters::get_reports_id($reports['entities_id'], 'public_map' . $reports['id']) . '&redirect_to=public_map' . $reports['id']))  . '</small>';
      }
      ?> 
  </td>
  <td><?php echo render_bool_value($reports['in_menu']) ?></td>    
  <td>
      <?php
      if(strlen($reports['users_groups']))
      {	
        $users_groups_list = array();
        foreach(explode(',',$reports['users_groups']) as $users_groups_id)
        {
          $users_groups_list[] = access_groups::get_name_by_id($users_groups_id);
        }
        
        echo implode('<br>',$users_groups_list);
      }
      ?>
   </td> 
</tr>  
<?php endwhile ?>
</tbody>
</table>
</div>
