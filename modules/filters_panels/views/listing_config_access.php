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

<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
	<h4 class="modal-title"><?php echo TEXT_USERS_GROUPS ?></h4>
</div>

<?php echo form_tag('menu_form', url_for('filters_panels/panels','action=set_listing_config_access&entities_id=' . $_GET['entities_id']),array('class'=>'form-horizontal')) ?>
<div class="modal-body">
  <div class="form-body">

	<p><?php echo TEXT_LISTING_CONFIG_ACCESS_INFO ?></p>

<?php 
$choices = [];
$choices[0] = TEXT_ADMINISTRATOR;

$groups_query = db_fetch_all('app_access_groups','','sort_order, name');
while($groups = db_fetch_array($groups_query))
{
	$entities_access_schema = users::get_entities_access_schema($_GET['entities_id'],$groups['id']);

	if(!in_array('view',$entities_access_schema) and  !in_array('view_assigned',$entities_access_schema)) continue;
		
	$choices[$groups['id']] = $groups['name'];
}

$entities_cfg = new entities_cfg(_get::int('entities_id'));

?>  
  <div class="form-group">  	
    <div class="col-md-12">	
  	  <?php echo select_tag('users_groups[]',$choices,$entities_cfg->get('listing_config_access'),array('class'=>'form-control chosen-select','multiple'=>'multiple')) ?>
    </div>			
  </div>
  
  <?php echo ajax_modal_template_footer() ?>

</form> 