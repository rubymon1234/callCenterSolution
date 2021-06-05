<?php

namespace App\Http\Controllers\Web;

use Auth;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Crypt;

class HomeController extends Controller
{
    /**
     * Error 403 (Permission Denied)
     * @param string 
     * @author Zoo/Ruban
    */
    public function accessDenied(){
    	return view('errors/403');
    }
}
