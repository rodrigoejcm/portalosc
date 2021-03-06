<?php

namespace App\Dao;

use DB;

class Dao
{
    public function executeQuery($query, $unique, $params = null)
    {
        $result = null;
        if($params){
    		$result_query = DB::select($query, $params);
        }else{
        	$result_query = DB::select($query);
        }
    	if($result_query){
	    	if($unique){
	    		$result = reset($result_query);
  			}else{
  	    		$result = $result_query;
  			}
    	}
    	return $result;
    }
}
