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

<h3 class="page-title"><?php echo TEXT_EXT_COMMON_REPORTS_GROUPS ?></h3>

<p><?php echo TEXT_REPORTS_GROUPS_INFO ?></p>

<?php echo button_tag(TEXT_BUTTON_ADD,url_for('ext/reports_groups/form')) ?>

<div class="table-scrollable">
<table class="table table-striped table-bordered table-hover">
<thead>
  <tr>
    <th><?php echo TEXT_ACTION ?></th>           
    <th width="100%"><?php echo TEXT_NAME ?></th>
    <th><?php echo TEXT_USERS_GROUPS ?></th>
    <th><?php echo TEXT_IN_MENU ?></th>           
    <th><?php echo TEXT_IN_DASHBOARD ?></th>
    <th><?php echo TEXT_SORT_ORDER ?></th>
  </tr>
</thead>
<tbody>
<?php
  $reports_query = db_query("select * from app_reports_groups where is_common=1 order by sort_order, name");
  while($v = db_fetch_array($reports_query)):
?>
  <tr>
    <td style="white-space: nowrap;"><?php echo button_icon_delete(url_for('ext/reports_groups/delete','id=' . $v['id'])) . ' ' . button_icon_edit(url_for('ext/reports_groups/form','id=' . $v['id'])); ?></td>        
    <td><?php echo link_to_modalbox($v['name'],url_for('dashboard/reports_groups_configure','id=' . $v['id'] . '&redirect_to=ext/reports_groups/reports')) ?></td>
    <td>
      <?php
        $users_groups_list = array();
        foreach(explode(',',$v['users_groups']) as $users_groups_id)
        {
          $users_groups_list[] = access_groups::get_name_by_id($users_groups_id);
        }
        
        echo implode('<br>',$users_groups_list); 
      ?>
    </td>
    <td><?php echo render_bool_value($v['in_menu']) ?></td>       
    <td><?php echo render_bool_value($v['in_dashboard']) ?></td>
    <td><?php echo $v['sort_order'] ?></td>
  </tr>
<?php endwhile?>
<?php if(db_num_rows($reports_query)==0) echo '<tr><td colspan="7">' . TEXT_NO_RECORDS_FOUND . '</td></tr>';?>  
</tbody>
</table>
</div>