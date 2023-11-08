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

<h3 class="page-title"><?php echo TEXT_HELP_SYSTEM ?></h3>

<p><?php echo TEXT_HELP_SYSTEM_INFO ?></p>


<?php echo button_tag(TEXT_ADD_ANNOUNCEMENT,url_for('help_pages/form','type=announcement&entities_id=' .  _get::int('entities_id'))) ?>

<div class="table-scrollable">
<table class="table table-striped table-bordered table-hover">
<thead>
  <tr>
    <th><?php echo TEXT_ACTION ?></th> 
    <th><?php echo TEXT_COLOR ?></th> 
    <th><?php echo TEXT_POSITION ?></th>
    <th width="100%"><?php echo TEXT_TITLE ?></th>      
    <th><?php echo TEXT_ASSIGNED_TO ?></th>
    <th><?php echo TEXT_IS_ACTIVE ?></th>        
    <th><?php echo TEXT_CREATED_BY ?></th>
    <th><?php echo TEXT_SORT_ORDER ?></th>
  </tr>
</thead>
<tbody>
<?php

  $access_groups_cache = access_groups::get_cache();
	
  $pages_query = db_query("select * from app_help_pages where entities_id='" . _get::int('entities_id') . "' and type='announcement' order by sort_order, name");
  while($pages = db_fetch_array($pages_query)):  
?>
  <tr>
    <td style="white-space: nowrap;"><?php echo button_icon_delete(url_for('help_pages/delete','id=' . $pages['id'] . '&entities_id=' .  _get::int('entities_id'))) . ' ' . button_icon_edit(url_for('help_pages/form','id=' . $pages['id'] . '&type=page'. '&entities_id=' .  _get::int('entities_id'))); ?></td>        
    <td><?php echo '<span class="label label-' . $pages['color'] . '">' . help_pages::get_color_by_name($pages['color']) . '</span>' ?></td>
    <td><?php 
        echo help_pages::get_position_by_name($pages['position']);
        if($pages['position']=='info')
        {            
            $reports_id = reports::auto_create_report_by_type(_GET('entities_id'), 'help_pages' . $pages['id']);
            $count_filters = reports::count_filters_by_reports_id($reports_id);
            echo  '<br>' . link_to(TEXT_FILTERS . ' (' . $count_filters . ')', url_for('default_filters/filters', 'reports_id=' . $reports_id . '&redirect_to=help_pages' . $pages['id']));
        }
    ?></td>                
    <td>
    	<?php echo $pages['name'] ?>
    	<div><i><small><?php echo app_truncate_text($pages['description']) ?></small></i></div>
    	<?php echo ($pages['start_date'] ? TEXT_DATE_FROM . ': ' . format_date($pages['start_date']) . '<br>': '') ?>
    	<?php echo ($pages['end_date'] ? TEXT_DATE_TO . ': ' . format_date($pages['end_date']) : '') ?>
    </td>            
    <td>
<?php
  if(strlen($pages['users_groups'])>0)
  {
    $users_groups = array();
    foreach(explode(',',$pages['users_groups']) as $id)
    {
      $users_groups[] = $access_groups_cache[$id];
    }
    
    if(count($users_groups)>0)
    {        
      echo '<span style="display:block" data-html="true" data-toggle="tooltip" data-placement="left" title="' . addslashes(implode(', ',$users_groups)). '">' . TEXT_USERS_GROUPS . ' (' . count($users_groups) . ')</span>';
    }
  }
    
?>    
    </td>
    <td><?php echo render_bool_value($pages['is_active']) ?></td>    
    <td><?php echo users::get_name_by_id($pages['created_by']) ?></td>
    <td><?php echo $pages['sort_order'] ?></td>
  </tr>
<?php endwhile?>
<?php if(db_num_rows($pages_query)==0) echo '<tr><td colspan="9">' . TEXT_NO_RECORDS_FOUND . '</td></tr>';?>  
</tbody>
</table>
</div>

<br>

<?php echo button_tag(TEXT_ADD_PAGE,url_for('help_pages/form','type=page&entities_id=' .  _get::int('entities_id'))) ?>

<div class="table-scrollable">
<table class="table table-striped table-bordered table-hover">
<thead>
  <tr>
    <th><?php echo TEXT_ACTION ?></th>                  
    <th><?php echo TEXT_POSITION ?></th>
    <th width="100%"><?php echo TEXT_TITLE ?></th>      
    <th><?php echo TEXT_ASSIGNED_TO ?></th>
    <th><?php echo TEXT_IS_ACTIVE ?></th>        
    <th><?php echo TEXT_CREATED_BY ?></th>
    <th><?php echo TEXT_SORT_ORDER ?></th>
  </tr>
</thead>
<tbody>
<?php
	$access_groups_cache = access_groups::get_cache();
	
  $pages_query = db_query("select * from app_help_pages where entities_id='" . _get::int('entities_id') . "' and type='page' order by position, sort_order, name");
  while($pages = db_fetch_array($pages_query)):  
?>
  <tr>
    <td style="white-space: nowrap;"><?php echo button_icon_delete(url_for('help_pages/delete','id=' . $pages['id'] . '&entities_id=' .  _get::int('entities_id'))) . ' ' . button_icon_edit(url_for('help_pages/form','id=' . $pages['id'] . '&type=page' . '&entities_id=' .  _get::int('entities_id'))); ?></td>
    <td><?php echo help_pages::get_position_by_name($pages['position']) ?></td>                
    <td><?php echo $pages['name'] ?></td>            
    <td>
<?php
  if(strlen($pages['users_groups'])>0)
  {
    $users_groups = array();
    foreach(explode(',',$pages['users_groups']) as $id)
    {
      $users_groups[] = $access_groups_cache[$id];
    }
    
    if(count($users_groups)>0)
    {        
      echo '<span style="display:block" data-html="true" data-toggle="tooltip" data-placement="left" title="' . addslashes(implode(', ',$users_groups)). '">' . TEXT_USERS_GROUPS . ' (' . count($users_groups) . ')</span>';
    }
  }
    
?>    
    </td>
    <td><?php echo render_bool_value($pages['is_active']) ?></td>    
    <td><?php echo users::get_name_by_id($pages['created_by']) ?></td>
    <td><?php echo $pages['sort_order'] ?></td>
  </tr>
<?php endwhile?>
<?php if(db_num_rows($pages_query)==0) echo '<tr><td colspan="9">' . TEXT_NO_RECORDS_FOUND . '</td></tr>';?>  
</tbody>
</table>
</div>
