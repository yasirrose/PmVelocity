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

<?php echo ajax_modal_template_header(TEXT_SORT_ORDER) ?>

<?php echo form_tag('templates_filter',url_for('ext/report_page/reports')) ?>

<div class="modal-body">

<ul id="reports" class="sortable">
<?php
$report_query = db_query("select * from app_ext_report_page where entities_id='" . db_input($report_page_filter) . "' order by sort_order, name");
while($report = db_fetch_array($report_query))
{
  echo '<li id="reports_' . $report['id'] . '">' . $report['name'] . '</li>';
}
?>
</ul>
</div>

<?php echo ajax_modal_template_footer() ?>

</form> 

<script>
  $(function() {         
    	$( "ul.sortable" ).sortable({
    		connectWith: "ul",
    		update: function(event,ui){  
          data = '';  
          $( "ul.sortable" ).each(function() {data = data +'&'+$(this).attr('id')+'='+$(this).sortable("toArray") });                            
          data = data.slice(1)                      
          $.ajax({type: "POST",url: '<?php echo url_for("ext/report_page/reports","action=sort")?>',data: data});
        }
    	});      
  });  
</script>