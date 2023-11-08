<?php

namespace Zadarma_API\Response;

class Response 
{
    public $sandbox;
    
    public function __construct($values)
    {
        $values = array_intersect_key($values, $this->toArray() + ['sandbox' => null]);
        foreach ($values as $k => $v) {
            $this->$k = $v;
        }
    }
    
    public function toArray() {
        return get_object_vars($this);
    }

}