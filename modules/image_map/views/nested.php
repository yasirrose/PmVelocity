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

<?php
$edit_access = true;

$item_info = db_find('app_entity_' . $current_entity_id, $current_item_id);

//get access schema for current entity
$current_access_schema = users::get_entities_access_schema($current_entity_id, $app_user['group_id']);

$access_rules = new access_rules($current_entity_id, $item_info);

$fields_access_schema = users::get_fields_access_schema($current_entity_id, $app_user['group_id']);

//check general access
if(!users::has_access('update', $access_rules->get_access_schema()))
{
    $edit_access = false;
}

//check fields access
if(isset($fields_access_schema[$_GET['fields_id']]))
{
    $edit_access = false;
}
?>		
<!--tabs-->
<div id="tabsContainer"   >	
    <div id="mapViewTab" class="tab-pane fade" >

        <div id="mapContainer" class="" data-path="<?php echo url_for('image_map/map_nested', 'path=' . $app_path . '&action=getMapView&fields_id=' . _GET('fields_id') . '&map_filename=' . $_GET['map_filename']) ?>" data-id="<?php echo _GET('fields_id') ?>" data-region-id="<?php echo $current_item_id ?>" data-edit-access="<?php echo $edit_access ?>" >

            <div id="mapViewer" class="viewer" style="width: 100%; height: 100%;" ></div>

            <div class="cfm-legend hide">            
                <ul class="unstyled"></ul>
            </div>

            <div class="cfm-info-left" >
            &nbsp;
            </div> 
            <div class="cfm-info" >              
                <ul class="cfm-breadcrumb breadcrumb"></ul>
            </div>

            <div class="crosshair" data-state="region"></div>

        </div> 

    </div>
</div>

<?php echo image_map::render_markers_color(_get::int('fields_id')) ?>

<script src="js/image-map/common/js/jquery-1.11.3.min.js"></script>	
<script src="js/image-map/common/js/bootstrap.js"></script>
<script src="js/image-map/common/js/bootstrap-adds.js"></script>
<script src="js/image-map/common/js/leaflet.js"></script>	
<script src="js/image-map/admin/js/jquery.validate.min.js"></script>

<script src="js/image-map/common/js/common_custom.js?v=4"></script>	
<script src="js/image-map/admin/js/plugins_custom.js?v=4"></script>	
<script src="js/image-map/admin/js/admin_custom.js?v=4"></script>		

<script>
    $(function ()
    {
        //open map
        viewCtrl.showTab("mapViewTab", [<?php echo _GET('fields_id') ?>, "marker"])
    })

</script>

<?php
if(!$edit_access)
{
    echo image_map::render_cfm_selected_css();
}
?>   
