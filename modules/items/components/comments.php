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

<div class="row">
  <div class="col-sm-8" style="min-width: 255px;">
    <div class="entitly-listing-buttons-left">
      <?php 
      	if(users::has_comments_access('create', $access_rules->get_comments_access_schema()))
      	{
            $text_add_comment = strlen($entity_cfg->get('comments_insert_button')) ? $entity_cfg->get('comments_insert_button') : TEXT_BUTTON_ADD_COMMENT;
      		echo '
    				<div class="btn-group">' . 
      				button_tag($text_add_comment, url_for('items/comments_form','path=' . $_GET['path']),true,array('class'=>'btn btn-primary btn-sm')) . 
      				'<button onClick="quick_comment_toggle()" style="margin-left: -5px;" title="' . addslashes(TEXT_QUICK_COMMENT) . '" type="button" class="btn btn-default btn-sm"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
      			</div>';
      	}
      	?>
      	
      	<?php 
            if(is_ext_installed())
            {
                $processes = new processes($current_entity_id);
                $processes -> items_id = $current_item_id;
                echo $processes->render_buttons('comments_section'); 
            }
        ?>
    </div>
  </div>
  <div class="col-sm-4">
    <div class="entitly-listing-buttons-right">    
      <?php echo render_comments_search_form($entity_info['id'],'items_comments_listing') ?>
    </div>                    
  </div>
</div> 

<?php require(component_path('items/quick_comment_form')); ?>

<div class="row">
  <div class="col-md-12">
    <div id="items_comments_listing"></div>
  </div>
</div>

<?php
    if(is_mobile())
    {
        $comments_listing_url = "items/comments_listing_mobile";
    }
    elseif($entity_cfg->get('comments_listing_type')=='list')
    {
        $comments_listing_url = "items/comments_listing_list";
    }
    else
    {
        $comments_listing_url = "items/comments_listing";
    }
?>

<script>
  function load_comments_listing(listing_container,page,search_keywords)
  {      
    $('#'+listing_container).append('<div class="data_listing_processing"></div>');
    $('#'+listing_container).css("opacity", 0.5);
    
    $('#'+listing_container).load('<?php echo url_for($comments_listing_url)?>',{path:'<?php echo $_GET["path"]?>',page:page,search_keywords:$('#'+listing_container+'_search_keywords').val()},
      function(response, status, xhr) {
        if (status == "error") {                                 
           $(this).html('<div class="alert alert-error"><b>Error:</b> ' + xhr.status + ' ' + xhr.statusText+'<div>'+response +'</div></div>')                    
        }
        $('#'+listing_container).css("opacity", 1);    
        
        appHandlePopover();   
        
        appHandleTruncatedText()
        
        ckeditor_images_content_prepare(); 

        //hightlight code
        $('code').each(function(i, block) {
        	if(!$(this).hasClass('hljs_tools'))
        	{
          	hljs.highlightBlock(block);
        	}
      	}); 

        hljs_init_copy_code()  
                
      }
    );
  }
  
  function reset_search()
  {
    $('#items_comments_listing_search_keywords').val('')
    load_comments_listing('items_comments_listing',1)
  }   

  $(function() {     
  	load_comments_listing('items_comments_listing',1,'');                                                                         
  });
  
    
</script> 