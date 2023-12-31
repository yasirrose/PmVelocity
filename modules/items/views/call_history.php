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

<?php echo ajax_modal_template_header(TEXT_EXT_HISTORY) ?>

<div class="modal-body ajax-modal-width-790">


<div class="table-scrollable">
	<table class="table table-striped table-bordered table-hover">
	<thead>
	  <tr>
	    <th><?php echo TEXT_DATE_ADDED?></th>
	    <th colspan="3" ><?php echo TEXT_TYPE ?></th>	    	    
	  </tr>
	</thead>
	<tbody>

<?php 
	$history_query = db_query("select * from app_ext_call_history where rukovoditel_regex_replace('[^0-9]','',phone)='" . preg_replace('/\D/', '',$_GET['phone']) . "' order by date_added desc");
	if(db_num_rows($history_query)==0) echo '<tr><td colspan="4">' . TEXT_NO_RECORDS_FOUND. '</td></tr>';
	while($history = db_fetch_array($history_query))
	{
		$html = '
	    		<tr>
	    			<td>' . format_date_time($history['date_added']). '</td>
	    			<td width="16" style="text-align: center">' . ($history['type']=='sms' ? '<i class="fa fa-mobile" aria-hidden="true"></i></td><td>' . TEXT_EXT_SMS : ($history['direction']=='out' ? '<i class="fa fa-long-arrow-right" aria-hidden="true"></i></td><td>' . TEXT_EXT_OUTGOING_CALL : '<i class="fa fa-phone" aria-hidden="true"></i></td><td>' . TEXT_EXT_INCOMING_CALL)). '</td>
						<td>' . ($history['type']=='phone' ? date("i:s", $history['duration']) : '') . '</td>
						<td style="white-space:normal; width: 100%">' . $history['sms_text']. '</td>
	    		</tr>
	    		';
		
		echo $html;
	}
?>

	</tbody>
	</table>
</div>

</div>

<?php echo ajax_modal_template_footer('hide-save-button') ?>
