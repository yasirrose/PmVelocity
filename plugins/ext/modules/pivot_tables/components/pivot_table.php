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

$html = $pivot_table->render_layout() . '

<script>
var pivot_table' . $pivot_table->id . ' = false;
$(function(){
     pivot_table' . $pivot_table->id . ' = new WebDataRocks({
        container: "#pivot_table_' . $pivot_table->id . '",
        toolbar: ' . $pivot_table->has_toolbar() . ',
        height: ' . $pivot_table->get_height() . ',
        global: {    		
    		localization: "' . $pivot_table->get_localization(). '"
    	}
    });

    pivot_table' . $pivot_table->id . '.setReport(' . $pivot_table->getReport() . ')

    pivot_table' . $pivot_table->id . '.on("update", function() {
        $.ajax({
            method: "post",
            url: "' . url_for('ext/pivot_tables/view','action=set_report&id=' . $pivot_table->id) . '",
            data: {settings: JSON.stringify(pivot_table' . $pivot_table->id . '.getReport())}
        })
    });

    pivot_table' . $pivot_table->id . '.on("reportchange", function() {
        $.ajax({
            method: "post",
            url: "' . url_for('ext/pivot_tables/view','action=set_report&id=' . $pivot_table->id) . '",
            data: {settings: JSON.stringify(pivot_table' . $pivot_table->id . '.getReport())}
        })
    })  
        
    ' . $pivot_table->render_chart() . ' 

//fix bug reportchange. This event not working with format cells
    setTimeout(function(){
       $("#wdr-tab-format-cells").click(function(){
          setTimeout(function(){
             $("#wdr-popup-format-cells #wdr-btn-apply").click(function(){
               $.ajax({
                    method: "post",
                    url: "' . url_for('ext/pivot_tables/view','action=set_report&id=' . $pivot_table->id) . '",
                    data: {settings: JSON.stringify(pivot_table' . $pivot_table->id . '.getReport())}
                })
             })        
          },300)
       })
    }, 300);     
    

    //expand pivot table if hidden
    $("#pivot_table_bar_' . $pivot_table->id. ' .pivot_table_bar_action").click(function(){
        if($(this).hasClass("expanded"))
        {
            $(this).removeClass("expanded")
            $(this).parent().css({height:"15px"})
        }
        else
        {
            $(this).addClass("expanded")
            $(this).parent().css({height:"' . $pivot_table->get_height() . 'px",position: "absolute"})
            $("#pivot_table_' . $pivot_table->id. '_chart").css("padding-top","15px")
        }
    })
    
})

</script>
';

echo $html;

echo $pivot_table->hide_actions_in_toolbar();

echo $pivot_table->get_cahrt_color_css();
