<?php

namespace App\Http\Controllers\Web;

use DB;
use Crypt;
use App\Models\Application;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AjaxController extends Controller
{
    /**
     * DID Manage Ajax call
     * @param string 
     * @author Zoo/Ruban
    */
    public function postAppvalue(Request $request){

    	/*try{*/

    		$app_name = $request->app_name;
    		$user_id = Crypt::decryptString($request->user_id);

	    	if($request->ajax()) {
	    		
	    		$app_Db = DB::table($app_name)->get();

	    		return response()->json([
		                'success' => true,
		                'message' =>'success',
		                'response' => $app_Db
		            ]);
	    	}

    	/*}catch(\Exception $e){

    		return response()->json([
	                'success' => false,
	                'message' => 'Oops, Something Went Wrong',
	            ]);
    	}*/
			
    }
}
