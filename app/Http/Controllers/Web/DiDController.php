<?php

namespace App\Http\Controllers\Web;

use URL;
use Auth;
use Redirect;
use App\Models\DiDNumbers;
use App\Models\Application;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Crypt;

class DiDController extends Controller
{
    /**
     * DID Manage
     * @param string 
     * @author Ruban
    */
    public function getDiDListing(){

		try {
			
			$user_id = Auth::user()->id;
			$DiDNumbers = DiDNumbers::paginate(10);
			$applications = Application::where('status','1')->get();

			return view('web.did.didList', compact('DiDNumbers','applications','user_id'));

		} catch (\Exception $e) {

        	return Redirect::back()->with('error_message', $e->getMessage());
    	}	
    }
    /**
     * Manage (Action) POST 
     * @param string 
     * @author Ruban
    */
    public function postManageDiD(Request $request){

       try {
            
            $user_id    = Auth::user()->id;
            $app_value  = $request->app_value;
            $app_name   = $request->name;
            $did        = Crypt::decryptString($request->id);

            if(isset($app_name)){
                //Insertion
                $InsertDiD = DiDNumbers::find($did);
                $InsertDiD->app_name = strtoupper(trim($app_name)); 
                $InsertDiD->app_value = $app_value; 
                $InsertDiD->save();

                if($InsertDiD->save()){
                    return Redirect::back()->with('success_message', 'DID Updated Successfully');
                }
            }
            
            return Redirect::back()->with('error_message', 'Oops something went wrong');

        } catch (\Exception $e) {

            return Redirect::back()->with('error_message', $e->getMessage());
        } 
    }
}
