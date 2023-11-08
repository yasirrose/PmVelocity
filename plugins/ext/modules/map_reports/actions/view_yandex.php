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

if(!isset($app_user))
{
    $app_user = [
        'id' => 0,
        'group_id' => 0
    ];
}

//check if report exist
$reports_query = db_query("select * from app_ext_map_reports where id='" . db_input(_POST('id')) . "'");
if(!$reports = db_fetch_array($reports_query))
{
    exit();
}

//check access
if(!map_reports::has_access($reports['users_groups']))
{
    exit();
}

$fiters_reports_id = _POST('fiters_reports_id');
$panel_fiters_reports_id = _POST('panel_fiters_reports_id');

$field_info = db_find('app_fields',$reports['fields_id']);

$cfg = new fields_types_cfg($field_info['configuration']);

$map_reports = new map_reports($reports, $fiters_reports_id, $field_info, $panel_fiters_reports_id);

$lat = 55.76;
$lng = 37.64;

if(strlen($reports['latlng']))
{
	$latlng = explode(',',$reports['latlng']);
        $lat = $latlng[0];
        $lng = $latlng[1];	
}	

$html = '
<script>
 
$(function(){

	
        ymaps.ready(init);
        function init(){
            let is_geliossoft = ' . $cfg->get('is_geliossoft',0) . '
                
            myMap = new ymaps.Map("yandex_map_container", {
                center: [' . $lat . ', ' . $lng . '],
                zoom: ' . $reports['zoom'] . '
            });

            ' . $map_reports->render_yandex_js() . '
                
            //центровка карты по всем точкам
            myMap.setBounds(myMap.geoObjects.getBounds(), {
                checkZoomRange: true,
                zoomMargin: 130
            });
            
            if(is_geliossoft==1)
            {
                new geliossoft_objects(myMap,"' . $reports['fields_id'] . '","' . $cfg->get('refresh_interval',60) . '","yandex")
            }
            
            $(".map-sidebar-item").click(function(){
                lat = $(this).attr("lat")
                lng = $(this).attr("lng")
                
                ymap_center(lat,lng)                
            })
        }
            
			
	set_goolge_map_height();
			
	$( window ).resize(function(){
		set_goolge_map_height();
	})		

})

function ymap_center(lat, lng)
{
    myMap.setCenter([lat,lng], 12)
}
			
function set_goolge_map_height()
{
    if($(".header").length)
    {
        $("#yandex_map_container").height($( window ).height()-$(".portlet-filters-preview").height()-$(".header").height()-150);
    }
    else
    {
        $("#yandex_map_container").height($( window ).height())
    }
}			
					
</script>
				
';	

if($reports['display_sidebar']==1)
{
    $portlets = new portlets('map_sidebar_' . $reports['id']);
    
    $html .= '
        <table class="table-sidebar">
            <tr>
                <td class="table-sidebar-content">
                    <div id="yandex_map_container" style="width:100%;  height: 600px;"></div>
                </td>
                <td class="table-sidebar-body" width="' . pivot_map_reports::get_sidebar_width($reports) . '" ' . $portlets->render_body(). '>
                    <div class="map-sidebar-list-scroller">' . $map_reports->get_sidebar() . '</div>
                </td>
                <td class="table-sidebar-action resize-ymap right ' . $portlets->button_css() . '"></td>
            </tr>    
        </table>         
        ';        
}
else
{
    $html .= '<div id="yandex_map_container" style="width:100%;  height: 600px;"></div>';
}

echo (count($map_reports->markers) ? $html : '<div class="alert alert-warning">' . TEXT_NO_RECORDS_FOUND . '</div>');
