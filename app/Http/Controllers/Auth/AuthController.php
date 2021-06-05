<?php

namespace App\Http\Controllers\Auth;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use \Illuminate\Contracts\Auth\Guard;
use Illuminate\Support\Facades\Validator;
use Illuminate\Routing\Redirector;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use URL;
use Redirect;


class AuthController extends Controller
{
    public function __construct(Guard $auth)
    {
        $this->auth = $auth;
    }

    public function index(){

    	return view('auth.login');
    }

    public function login(Request $request){

        
        try {
           
        	$this->validate($request, [
                'email' => 'required|email', 'password' => 'required',
            ]);

            $credentials = $request->only('email', 'password');

            if ($this->auth->attempt($credentials))
            { 	
                
                return redirect()->route('web.home')->with('login_success_message', 'Login Successfully');
            }
            
            return Redirect::back()->withInput($request->only('email', 'remember'))->withErrors([
                            'email' => 'User name OR password does not Matched',
                    ]);
            
        } catch (\Exception $e) {

            return Redirect::back()->with('error_message', $e->getMessage());
        }
    }
    public function homelanding(Request $request)
    {  
        return view('web.home');
    }
}
