@extends('layouts.outer')
@section('title', 'Login')
@section('content')
<div class="login-box">
    <div class="login-logo">
        <a href="../../index2.html"><b>CallCenter</b>App</a>
    </div>
    <div class="card">
        <div class="card-body login-card-body">
            <p class="login-box-msg">{{ __('Login') }}</p>
            <form method="POST" action="{{ route('login') }}">
                <input type="hidden" name="_token" value="{{ csrf_token() }}">
                <div class="input-group mb-3">
                    <input type="email" id="email" name="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}{{ $errors->has('error') ? ' is-invalid' : '' }}" placeholder="{{ __('E-Mail Address') }}" autocomplete="nope" value="{{ old('email') }}" autofocus>
                    <div class="input-group-append">
                        <div class="input-group-text">
                            <span class="fas fa-envelope"></span>
                        </div>
                    </div>
                    @if ($errors->has('email'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('email') }}</strong>
                        </span>
                    @endif
                </div>
                <div class="input-group mb-3">
                    <input type="password" id="password" name="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}{{ $errors->has('error') ? ' is-invalid' : '' }}" placeholder="{{ __('Password') }}">
                    <div class="input-group-append">
                        <div class="input-group-text">
                          <span class="fas fa-lock"></span>
                        </div>
                    </div>
                    @if ($errors->has('password'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('password') }}</strong>
                        </span>
                    @endif
                    @if($errors->has('error'))
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $errors->first('error') }}</strong>
                        </span>
                    @endif
                </div>
                <div class="row">
                    <div class="col-8">
                        <div class="icheck-primary">
                          <input type="checkbox" id="remember" >
                          {{-- <label for="remember">Remember Me </label>--}}                    
                        </div>
                    </div>
                  <div class="col-4">
                    <button type="submit" class="btn btn-primary btn-block">Sign In</button>
                  </div>
                </div>
            </form>
            <p class="mb-1">
                <a href="{{url('password/reset')}}">I forgot my password </a>
            </p>
            {{-- <p class="mb-0">
                <a href="register.html" class="text-center">Register a new membership</a>
            </p> --}}
        </div>
    </div>
</div>
@endsection
