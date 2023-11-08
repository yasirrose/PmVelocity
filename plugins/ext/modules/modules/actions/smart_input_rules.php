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

switch($app_module_action)
{
	case 'save':
		 
		$sql_data = array(
		'modules_id' => $_POST['modules_id'],
		'entities_id' => $_POST['entities_id'],
		'fields_id'=> (isset($_POST['fields_id']) ?  $_POST['fields_id']:0),
		'type'=> $_POST['type'],
		'rules'=> $_POST['rules'],
                'settings'=> isset($_POST['settings']) ? json_encode($_POST['settings']): '',    
		);

		if(isset($_GET['id']))
		{
			db_perform('app_ext_smart_input_rules',$sql_data,'update',"id='" . db_input($_GET['id']) . "'");
		}
		else
		{
			db_perform('app_ext_smart_input_rules',$sql_data);
		}

		redirect_to('ext/modules/smart_input_rules');

		break;
	case 'delete':

		if(isset($_GET['id']))
		{
			db_delete_row('app_ext_smart_input_rules',$_GET['id']);
		}
		 
		redirect_to('ext/modules/smart_input_rules');
		break;
	case 'get_entities_fields':

		$entities_id = _post::int('entities_id');

		$html = '';
		$obj = array();

		if(isset($_POST['id']))
		{
			$obj = db_find('app_ext_smart_input_rules',$_POST['id']);
		}
		else
		{
			$obj = db_show_columns('app_ext_smart_input_rules');
		}
		
		$modules = new modules('smart_input');
		
		$html .= smart_input::render_module_itnegration_types_by_id($_POST['modules_id'],$obj['type'],$obj['settings']);
				
		$choices = array();
		$fields_query = db_query("select f.*, t.name as tab_name from app_fields f, app_forms_tabs t where f.type in ('fieldtype_input','fieldtype_input_email','fieldtype_textarea','fieldtype_input_masked','fieldtype_input_dynamic_mask') and f.entities_id='" . $entities_id . "' and f.forms_tabs_id=t.id order by t.sort_order, t.name, f.sort_order, f.name");
		while($fields = db_fetch_array($fields_query))
		{
			$choices[$fields['id']] = $fields['name'];
		}
		 
		$entity_field_html = '
        			<div class="form-group" >
						  	<label class="col-md-3 control-label" for="cfg_sms_send_to_record_number">' .  TEXT_FIELD . '</label>
						    <div class="col-md-9">
						  	  ' . select_tag('fields_id',$choices, $obj['fields_id'],array('class'=>'form-control input-large required')) . '
						  	  ' . tooltip_text(TEXT_AVAILABLE_FIELDS . ': ' . TEXT_FIELDTYPE_INPUT_TITLE . ', ' . TEXT_FIELDTYPE_INPUT_EMAIL_TITLE . ', ' . TEXT_FIELDTYPE_TEXTAREA_TITLE) . '
						    </div>
						  </div>
        			';		
		$html .= smart_input::render_module_itnegration_rules_by_id($_POST['modules_id'],$obj['rules'], $entity_field_html);

		echo $html;

		exit();
		break;
}
