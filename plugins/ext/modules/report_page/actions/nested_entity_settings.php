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

$report_page_query = db_query("select * from app_ext_report_page where id='" . _GET('report_id') . "'");
if(!$report_page = db_fetch_array($report_page_query))
{    
    exit();
}

if(isset($_POST['id']))
{
    $obj = db_find('app_ext_report_page_blocks',$_POST['id']);
}
else
{
    $obj = db_show_columns('app_ext_report_page_blocks');
}

$entity_id = $_POST['entity_id']??0;
$settings = new settings($obj['settings']);

if(!isset_entity($entity_id))
{
    exit();
}



$choices = [
    'inline' => TEXT_IN_ONE_LINE,
    'list' => TEXT_LIST,
    'table' => TEXT_TABLE,
    //'table_list' =>TEXT_EXT_TABLE_LIST,
    //'tree_table' =>TEXT_TREE_TABLE,
]; 

$html = '
    <div class="form-group">
        <label class="col-md-3 control-label">' . TEXT_DISPLAY_AS . '</label>
        <div class="col-md-9">' . select_tag('settings[display_us]',$choices,$settings->get('display_us'),['class'=>'form-control input-medium']) . '</div>			
    </div>

    <div form_display_rules="settings_display_us: inline,list">    
        <div class="form-group">
            <label class="col-md-3 control-label" for="fields_id">' . TEXT_PATTERN  . fields::get_available_fields_helper($entity_id, 'settings_pattern') . '</label>
            <div class="col-md-9">' . input_tag('settings[pattern]',$settings->get('pattern'),['class'=>'form-control input-xlarge code']) . tooltip_text(TEXT_HEADING_TEMPLATE_INFO).  '</div>			
        </div>
    </div>

    <div form_display_rules="settings_display_us: list">    
        <div class="form-group">
            <label class="col-md-3 control-label" for="fields_id">' . sprintf(TEXT_EXT_TAG_X_ATTRIBUTES,'UL')  . '</label>
            <div class="col-md-9">' . input_tag('settings[tag_ul_attributes]',$settings->get('tag_ul_attributes'),['class'=>'form-control input-xlarge code']) . tooltip_text(TEXT_EXAMPLE . ': <code>class="list-unstyled"</code>').  '</div>			
        </div>
    </div>

    <div form_display_rules="settings_display_us: table"> 
        <div class="form-group">
            <label class="col-md-3 control-label" for="fields_id">' . sprintf(TEXT_EXT_TAG_X_ATTRIBUTES,'TABLE')  . '</label>
            <div class="col-md-9">' . input_tag('settings[tag_table_attributes]',$settings->get('tag_table_attributes'),['class'=>'form-control input-xlarge code']) . tooltip_text(TEXT_DEFAULT . ': <code>class="table table-striped table-bordered table-hover"</code>').  '</div>			
        </div>
        <div class="form-group settings-table">
            <label class="col-md-3 control-label" for="settings_line_numbering">' . TEXT_EXT_LINE_NUMBERING . '</label>
            <div class="col-md-1"><p class="form-control-static">' . input_checkbox_tag('settings[line_numbering]',1,['checked'=>$settings->get('line_numbering')]) . '</p></div>                
            <div class="col-md-2">' . input_tag('settings[line_numbering_heading]',$settings->get('line_numbering_heading'),['class'=>'form-control input-small','placeholder'=>TEXT_HEADING]) . '</div>
        </div>
        <div class="form-group settings-table">
            <label class="col-md-3 control-label" for="settings_column_numbering">' . TEXT_EXT_COLUMN_NUMBERING . '</label>
            <div class="col-md-1"><p class="form-control-static">' . input_checkbox_tag('settings[column_numbering]',1,['checked'=>$settings->get('column_numbering')]) . '</p></div>            		
        </div> 
    </div>
    ';

echo $html;

exit();