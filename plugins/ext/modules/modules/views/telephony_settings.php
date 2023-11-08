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

<h3 class="page-title"><?php echo TEXT_EXT_TELEPHONY_SETTINGS ?></h3>

<?php echo form_tag('cfg', url_for('configuration/save'), array('class' => 'form-horizontal')) ?>

<div class="form-body">

    <h3 class="form-section"><?php echo TEXT_EXT_INCOMING_CALL ?></h3>
    <p><?php echo TEXT_EXT_INCOMING_CALL_INFO ?></p>

    <div class="form-group">
        <label class="col-md-3 control-label" for="entities_id"><?php echo TEXT_ENTITY ?></label>
        <div class="col-md-9">	
            <?php echo select_tag('entities_id', entities::get_choices_with_empty(''), CFG_INCOMING_CALL_ENTITY, ['class' => 'form-control input-large']) ?>
        </div>			
    </div>

    <div id="entities_fields"></div>

    <div class="form-group">
        <label class="col-md-3 control-label" for="entities_id"><?php echo TEXT_URL ?></label>
        <div class="col-md-9">	
            <?php echo textarea_tag('url', url_for('ext/telephony/incoming_call', 'phone=%NUMBER%'), ['class' => 'form-control input-xlarge textarea-small select-all', 'readonly' => 'readonly']) ?>
            <?php echo tooltip_text(TEXT_EXT_INCOMING_URL_INFO) ?>
        </div>			
    </div>

    <h3 class="form-section"><?php echo TEXT_EXT_SAVE_CALL ?></h3>
    <p><?php echo TEXT_EXT_SAVE_CALL_INFO ?></p>

    <div class="form-group">
        <label class="col-md-3 control-label" for="entities_id"><?php echo TEXT_URL ?></label>
        <div class="col-md-9">	
            <?php echo textarea_tag('url', url_for('ext/telephony/save_call', 'key=' . CFG_API_KEY . '&phone=%NUMBER%&date_added=%TIMESTAMP%&direction=%DIRECTION%&duration=%DURATION%'), ['class' => 'form-control input-xlarge select-all', 'readonly' => 'readonly']) ?>
            <?php echo tooltip_text(TEXT_EXT_SAVE_CALL_URL_INFO) ?>
        </div>			
    </div>
    
    
    <h3 class="form-section"><?php echo TEXT_EXT_CALL_HISTORY ?></h3>
    
    <div class="form-group">
        <label class="col-md-3 control-label" for="entities_id"><?php echo TEXT_DISPLAY_IN_MENU ?></label>
        <div class="col-md-9">	
            <?php echo select_tag('CFG_CALL_HISTORY_IN_MNU', ['0'=>TEXT_NO,'1'=>TEXT_YES], CFG_CALL_HISTORY_IN_MNU, ['class' => 'form-control input-small configuration-set']) ?>
        </div>			
    </div>
    
    <div class="form-group">
        <label class="col-md-3 control-label" for="entities_id"><?php echo TEXT_ACCESS ?></label>
        <div class="col-md-9">	
            <?php echo select_tag('CFG_CALL_HISTORY_ACCESS', access_groups::get_choices(), CFG_CALL_HISTORY_ACCESS, ['class' => 'form-control input-xlarge chosen-select configuration-set','multiple'=>'multiple']) ?>
        </div>			
    </div>
    
<?php
$choices = [];
$entities_query = db_query("select * from app_entities where parent_id=0 order by sort_order, name");
while($entities = db_fetch_array($entities_query))
{
    $choices[$entities['id']] = $entities['name'];
}
?>
    
    <div class="form-group">
        <label class="col-md-3 control-label" for="entities_id"><?php echo TEXT_EXT_RELATD_ENTITIES ?></label>
        <div class="col-md-9">	
            <?php echo select_tag('CFG_CALL_HISTORY_ENTITIES', $choices, CFG_CALL_HISTORY_ENTITIES, ['class' => 'form-control input-xlarge chosen-select configuration-set','multiple'=>'multiple']) ?>
        </div>			
    </div>


</div>
</form>

<script>
    $(function ()
    {
        ext_get_entities_fields();

        $('#entities_id').change(function ()
        {
            ext_get_entities_fields();
        })
    });

    function ext_get_entities_fields()
    {
        var entities_id = $('#entities_id').val();

        $('#entities_fields').html('<div class="ajax-loading"></div>');

        $('#entities_fields').load('<?php echo url_for("ext/modules/telephony_settings", "action=get_entities_fields") ?>', {entities_id: entities_id}, function (response, status, xhr)
        {
            if (status == "error")
            {
                $(this).html('<div class="alert alert-error"><b>Error:</b> ' + xhr.status + ' ' + xhr.statusText + '<div>' + response + '</div></div>')
            }
            else
            {
                appHandleUniform();
            }
        });
    }

    function set_incoming_call_field()
    {
        var incoming_call_field = $('#incoming_call_field').val();
        $.ajax({
            method: 'POST',
            url: '<?php echo url_for("ext/modules/telephony_settings", "action=set_incoming_call_field") ?>',
            data: {incoming_call_field: incoming_call_field}
        })
    }

</script>