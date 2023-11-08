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

//check access
if($app_user['group_id']>0)
{
  redirect_to('dashboard/access_forbidden');
}

$template_info_query = db_query("select ep.*, e.name as entities_name from app_ext_export_templates ep, app_entities e where e.id=ep.entities_id and ep.id='" . db_input(_GET('templates_id')) . "'");
if(!$template_info = db_fetch_array($template_info_query))
{
    redirect_to('ext/templates/export_templates');
}

if(isset($_GET['parent_block_id']))
{
    $parent_block_query = db_query("select b.*, f.entities_id, f.name as field_name, f.configuration as field_configuration, f.type as field_type from app_ext_items_export_templates_blocks b, app_fields f where b.fields_id = f.id and  b.id=" . _GET('parent_block_id'),false);
    if(!$parent_block = db_fetch_array($parent_block_query))
    {
        redirect_to('ext/templates_xlsx/blocks','templates_id=' . $template_info['id']);
    }
    
    //if subentity
    if($parent_block['field_type']=='fieldtype_id' and $app_entities_cache[$parent_block['entities_id']]['parent_id']==$template_info['entities_id'])
    {
        $parent_block['field_name'] = $app_entities_cache[$parent_block['entities_id']]['name'];
    }
}

if(isset($_GET['row_id']))
{
    $row_info_query = db_query("select b.* from app_ext_items_export_templates_blocks b where b.id=" . _GET('row_id'),false);
    if(!$row_info = db_fetch_array($row_info_query))
    {
        redirect_to('ext/templates_xlsx/blocks','templates_id=' . $template_info['id']);
    }    
}