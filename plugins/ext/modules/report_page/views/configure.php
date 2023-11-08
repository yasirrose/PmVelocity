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

<ul class="page-breadcrumb breadcrumb">
    <li><?php echo link_to(TEXT_EXT_REPORT_DESIGNER, url_for('ext/report_page/reports')) ?><i class="fa fa-angle-right"></i></li>    
    <?php
    if(isset($app_entities_cache[$report_info['entities_id']]))
    {
        echo '<li>' . $app_entities_cache[$report_info['entities_id']]['name'] . '<i class="fa fa-angle-right"></i></li>';
    }
    ?>
    <li><?php echo $report_info['name'] ?></li>
</ul>


<?php
$use_editor = $report_info['use_editor'];

$blocks_dropdown = new report_page\blocks_dropdown($report_info['id']);
echo $blocks_dropdown->render();

?>

<?php echo form_tag('code_mirror_form', url_for('ext/report_page/configure', 'action=save&id=' . $_GET['id']), array('class' => 'form-horizontal')) ?>

<div class="row">
    <div  class="col-md-12">
        <?php echo textarea_tag('description', $report_info['description'],['class'=>($use_editor!=1 ? 'code_mirror':''),'mode'=>'xml','size'=>600]) ?>

        <br>

        <?php echo submit_tag(TEXT_BUTTON_SAVE) . ' ' . button_tag(TEXT_BUTTON_BACK, url_for('ext/report_page/reports'), false, array('class' => 'btn btn-default')) ?>
        
        <i class="fa fa-check" style="display:none" aria-hidden="true"></i>                
        <div class="fa fa-spinner fa-spin primary-modal-action-loading"></div> 
        
        <br>					

    </div>
</div>

</form>

<?php echo app_include_codemirror(['javascript','sql','php','clike','css','xml']) ?>

<script>
    $(function ()
    {
        use_eidtor = <?php echo $use_editor ?>
        
        if(use_eidtor==1)
        {
            use_editor_full('description', true)

            $('.insert_block_to_description').click(function ()
            {
                html = $(this).attr('data_insert').trim();
                CKEDITOR.instances.description.insertText(html);
            })
        }
        else
        {
            appHandleCodeMirror()
                            
            $('.insert_block_to_description').click(function ()
            {
                html = $(this).attr('data_insert').trim();                
                insert_to_code_mirror('description',html)                                
            })
        }
    })
    
$( "#code_mirror_form").submit(function( event ) {
            
    $('.primary-modal-action-loading').css('visibility','visible')

    if(app_code_mirror['description'])
    {
        app_code_mirror['description'].save()
    }
    
    if(CKEDITOR_holders['description'])
    {
        CKEDITOR_holders['description'].updateElement()
    }
        $.ajax({
                method: 'POST',
                url: $(this).attr('action'),
                data: $(this).serializeArray()
                }).done(function( msg ) {
                        $('.primary-modal-action-loading').css('visibility','hidden')
                        $('#code_mirror_form .fa-check').show().fadeOut();
               })

  return false;
});   


//CKEDITOR crtl+s
$(function(){
    if(CKEDITOR_holders['description'])
    {
        var isCtrl = false;
        
        CKEDITOR_holders['description'].on( 'contentDom', function( evt )
        {    
            CKEDITOR_holders['description'].document.on( 'keyup', function(event)
            {
                if(event.data.$.keyCode == 17) isCtrl=false;
            });
            
           CKEDITOR_holders['description'].document.on( 'keydown', function(event)
           {
              
               if(event.data.$.keyCode == 17) isCtrl=true;
               if(event.data.$.keyCode == 83 && isCtrl == true)
               {
                   //The preventDefault() call prevents the browser's save popup to appear.
                   //The try statement fixes a weird IE error.
                   try {
                       event.data.$.preventDefault();
                   } catch(err) {}

                   //Call to your save function
                   $( "#code_mirror_form").submit()

                   return false;
               }
           });
       })
    }
 })

</script>


