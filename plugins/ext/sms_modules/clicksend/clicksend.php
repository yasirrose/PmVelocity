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


class clicksend
{
	public $title;
        public $site;
        public $api;
        public $version;

	function __construct()
	{
		$this->title = TEXT_MODULE_CLICKSEND_TITLE;
		$this->site = 'https://www.clicksend.com';
		$this->api = 'https://developers.clicksend.com/docs/http/v2/?php#send-an-sms';
		$this->version = '1.0';
	}

	public function configuration()
	{
		$cfg = array();

		$cfg[] = array(
				'key'	=> 'username',
				'type' => 'input',
				'default' => '',
				'title'	=> TEXT_USERNAME,
				'description'	=> TEXT_MODULE_CLICKSEND_USERNAME_INFO,
				'params' =>array('class'=>'form-control input-large required'),
		);
		
		$cfg[] = array(
				'key'	=> 'key',
				'type' => 'input',
				'default' => '',
				'title'	=> TEXT_EXT_API_KEY,
				'description'	=> TEXT_MODULE_CLICKSEND_API_KEY_INFO,
				'params' =>array('class'=>'form-control input-large required'),
		);
			

		return $cfg;
	}

	function send($module_id, $destination = array(),$text = '')
	{
		global $alerts;

		$cfg = modules::get_configuration($this->configuration(),$module_id);
		$url = "https://api-mapper.clicksend.com/http/v2/send.php";

		foreach($destination as $phone)
		{
			$phone  = preg_replace('/\D/', '', $phone);
			
			$params=[
					'username' => $cfg['username'], 
					'key' => $cfg['key'],
					'to' => '+' . $phone,
					'message' => substr(strip_tags($text),0,960),					
			];
			
							
			$ch = curl_init($url);
			curl_setopt($ch, CURLOPT_HEADER, false);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS, ($params));
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
			curl_setopt($ch, CURLOPT_TIMEOUT, 10);
			$result = curl_exec($ch);
			curl_close($ch);
				
			if($result)
			{
				$result = new SimpleXMLElement($result);;
				
				//print_rr($result);
								
				if($result->messages->message->errortext!='Success')
				{
					$alerts->add($this->title . ' ' . TEXT_ERROR . ' ' . $result->messages->message->result . ' ' .  $result->messages->message->errortext,'error');
				}
				
			}
						
		}
	}

}