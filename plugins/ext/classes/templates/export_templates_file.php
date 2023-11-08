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

class export_templates_file
{
    public $entities_id;
    
    public $items_id;
    
    public $filename_sufix;
            
    function __construct($entities_id, $items_id) 
    {
        $this->entities_id = $entities_id;
        $this->items_id = $items_id;
        
        $this->filename_sufix = '';
    }
    
    function save($template_id,$save_type)
    {
        $filename = '';
        
        if(substr($template_id,0,6)=='report')
        {
            $template_id = substr($template_id,6);
            
            $report_query = db_query("select * from app_ext_report_page where id='" . $template_id . "'");
            if($report = db_fetch_array($report_query))
            {
                $filename = $this->save_report_page_to_pdf($report);
            }
            
            return $filename;
        }
        
        
        $templates_query = db_query("select * from app_ext_export_templates where id='" . $template_id . "'");
        if($templates = db_fetch_array($templates_query))
        {
            if(in_array($templates['type'],['html','html_code','label']))
            {
                $filename = $this->save_html_to_pdf($templates);
            }
            elseif($templates['type']=='docx' and $save_type=='docx')
            {
                $filename = $this->save_docx($templates);
            }
            elseif($templates['type']=='docx' and $save_type=='pdf')
            {
                $filename = $this->save_docx_to_pdf($templates);
            }
            elseif($templates['type']=='xlsx')
            {
                $filename = $this->save_docx_to_xlsx($templates);                
            }
        }
        
        return $filename;                
    }
    
    function save_report_page_to_pdf($report)
    {
        if(strlen($report['save_filename']))
        {
            $item = items::get_info($this->entities_id, $this->items_id);

            $pattern = new fieldtype_text_pattern;
            $filename = $pattern->output_singe_text($report['save_filename'], $this->entities_id, $item);
        }
        else
        {
            $filename = $report['name'] . '_' . $this->entities_id;
        }
        
        $filename = app_remove_special_characters($filename);
        
        $page = new report_page\report($report);
        $page->set_item($this->entities_id,$this->items_id);
        $html = $page->get_html();
                        
        
        $html = '
            <html>
              <head>
                  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                  <link href="template/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
                  
                <style>               
                    body { 
                       font-family: arial;                 
                    }

                    .h1, .h2, .h3, .h4, .h5, .h6, h1, h2, h3, h4, h5, h6 {
                       font-family: arial;   
                       font-weight: normal;
                    }
                 </style>
                 
                ' . app_include_custom_css() . '
              </head>        
              <body>
               ' . $html . '            
              </body>
            </html>
        ';
        
        $dompdf = new Dompdf\Dompdf(); 

        if($report['page_orientation']=='landscape')
        {
          $dompdf->set_paper('letter', 'landscape');
        }
        
        //echo $html;
        //exit();

        $dompdf->load_html($html);
        $dompdf->render();
                                
        $file = attachments::prepare_filename($filename . '.pdf');
        
        if(file_put_contents(DIR_FS_ATTACHMENTS . $file['folder'] . '/' . $file['file'], $dompdf->output()))
        {
            return $file['name'];
        }
        else
        {
            return '';
        }  
    }
    
    function get_template_filename($template_info)
    {
        if(strlen($template_info['template_filename']))
        {
            $item = items::get_info($this->entities_id, $this->items_id);

            $pattern = new fieldtype_text_pattern;
            $filename = $pattern->output_singe_text($template_info['template_filename'], $this->entities_id, $item);
        }
        else
        {
            $filename = $template_info['name'] . '_' . $this->entities_id;
        }
        
        $filename = app_remove_special_characters($filename);
        
        $filename .= $this->filename_sufix;
        
        return $filename;
    }
    
    function save_docx_to_xlsx($template_info)
    {
        $xlsx = new export_templates_xlsx($template_info);
        $xlsx->prepare_template_file($this->entities_id, $this->items_id); 
        
        $file = attachments::prepare_filename($this->get_template_filename($template_info) . '.xlsx');
        
        $filename = $xlsx->get_temp_filename();
        if(copy(DIR_FS_TMP . $filename, DIR_FS_ATTACHMENTS . $file['folder'] . '/' . $file['file']))
        {
            unlink(DIR_FS_TMP . $filename);
            return $file['name'];
        }
        else
        {
            return '';
        }
    }
    
    function save_docx($template_info)
    {
        $docx = new export_templates_blocks($template_info);
        $filename = $docx->prepare_template_file($this->entities_id, $this->items_id);
        
        $file = attachments::prepare_filename($this->get_template_filename($template_info) . '.docx');
        
        if(copy(DIR_FS_TMP . $filename, DIR_FS_ATTACHMENTS . $file['folder'] . '/' . $file['file']))
        {
            unlink(DIR_FS_TMP . $filename);
            return $file['name'];
        }
        else
        {
            return '';
        }
    }
    
    function save_docx_to_pdf($template_info)
    {
        $docx = new export_templates_blocks($template_info);
        $filename = $docx->prepare_template_file($this->entities_id, $this->items_id);
        
        $temp_pdf_filename = DIR_FS_TMP . $filename . '.pdf';
        
        //prepare PDF
        \PhpOffice\PhpWord\Settings::setPdfRendererPath(CFG_PATH_TO_DOMPDF);
        \PhpOffice\PhpWord\Settings::setPdfRendererName('DomPDF');
        
        //Load temp file
        $phpWord = \PhpOffice\PhpWord\IOFactory::load(DIR_FS_TMP . $filename); 

        //Save it
        $xmlWriter = \PhpOffice\PhpWord\IOFactory::createWriter($phpWord , 'PDF');
        $xmlWriter->save($temp_pdf_filename);
        
        $file = attachments::prepare_filename($this->get_template_filename($template_info) . '.pdf');
        
        if(copy($temp_pdf_filename, DIR_FS_ATTACHMENTS . $file['folder'] . '/' . $file['file']))
        {
            unlink(DIR_FS_TMP . $filename);
            unlink($temp_pdf_filename);
            return $file['name'];
        }
        else
        {
            return '';
        }
    }
        
    function save_html_to_pdf($template_info)
    {
        $export_template = $template_info['template_header'] . export_templates::get_html($this->entities_id, $this->items_id,$template_info['id']) . $template_info['template_footer'];
      
        $html = '
        <html>
          <head>
              <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

              <style>               
                body { 
                  font-family:   DejaVu Sans, sans-serif;                 
                 }

                body, table, td {
                  font-size: 12px;
                  font-style: normal;
                }

                table{
                  border-collapse: collapse;
                  border-spacing: 0px;                
                }

                c{
                  font-family: STXihei;
                  font-style: normal;
                  font-weight: 400;
                }

                                  ' . $template_info['template_css'] . '
              </style>
          </head>        
          <body>
           ' . $export_template . '            
          </body>
        </html>
        ';

        //Handle Chinese & Japanese symbols
        $html = preg_replace('/[\x{4E00}-\x{9FBF}\x{3040}-\x{309F}\x{30A0}-\x{30FF}]/u', '<c>${0}</c>',$html);
        $html = str_replace('。','.',$html);

        //Handle Korean symbols 
        $html = preg_replace('/[\x{3130}-\x{318F}\x{AC00}-\x{D7AF}]/u', '<c>${0}</c>',$html);
                              
        $dompdf = new Dompdf\Dompdf(); 

        if($template_info['page_orientation']=='landscape')
        {
          $dompdf->set_paper('letter', 'landscape');
        }
        
        //echo $html;
        //exit();

        $dompdf->load_html($html);
        $dompdf->render();
                                
        $file = attachments::prepare_filename($this->get_template_filename($template_info) . '.pdf');
        
        if(file_put_contents(DIR_FS_ATTACHMENTS . $file['folder'] . '/' . $file['file'], $dompdf->output()))
        {
            return $file['name'];
        }
        else
        {
            return '';
        }                
    }
}