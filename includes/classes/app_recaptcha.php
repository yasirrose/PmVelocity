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

class app_recaptcha
{

    static function is_enabled()
    {
        if(strlen(CFG_RECAPTCHA_KEY) and strlen(CFG_RECAPTCHA_SECRET_KEY) and CFG_RECAPTCHA_ENABLE == true)
        {
            if(!defined('CFG_RECAPTCHA_TRUSTED_IP')) define('CFG_RECAPTCHA_TRUSTED_IP','');
            
            if(strlen(CFG_RECAPTCHA_TRUSTED_IP) and in_array($_SERVER['REMOTE_ADDR'],array_map('trim',explode(',',CFG_RECAPTCHA_TRUSTED_IP))))
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        else
        {
            return false;
        }
    }

    static function render_js()
    {
        if(self::is_enabled())
        {
            return '<script src="https://www.google.com/recaptcha/api.js?hl=' . APP_LANGUAGE_SHORT_CODE . '"></script>';
        }
        else
        {
            return '';
        }
    }

    static function render()
    {
        return '<div class="g-recaptcha" data-sitekey="' . CFG_RECAPTCHA_KEY . '"></div>';
    }

    static function verify()
    {
        require('includes/libs/ReCaptcha/ReCaptcha.php');
        require('includes/libs/ReCaptcha/RequestMethod.php');
        require('includes/libs/ReCaptcha/RequestParameters.php');
        require('includes/libs/ReCaptcha/Response.php');
        require('includes/libs/ReCaptcha/RequestMethod/Curl.php');
        require('includes/libs/ReCaptcha/RequestMethod/CurlPost.php');

        $recaptcha = new \ReCaptcha\ReCaptcha(CFG_RECAPTCHA_SECRET_KEY);
        $resp = $recaptcha->verify($_POST['g-recaptcha-response'], $_SERVER['REMOTE_ADDR']);

        //print_r($resp->getErrorCodes());		
        //exit();

        return $resp->isSuccess();
    }

}
