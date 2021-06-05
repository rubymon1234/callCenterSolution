@extends('layouts.master')
@section('title', 'Dashboard')
@section('content')
<section class="content-header">
    <div class="container-fluid">
        @if (session('login_success_message'))
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                 Hi {{ Auth::user()->name }}  , {{ session('login_success_message') }}
            </div>
        @endif
    </div>
</section>
	@if(session('error_message'))
        <div class="alert alert-danger alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            {{ session('error_message') }}
        </div>
    @endif
    @if(session('success_message'))
        <div class="alert alert-success alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            {{ session('success_message') }}
        </div>
    @endif
    @if(session('warning_message'))
        <div class="alert alert-warning alert-dismissable">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            {{ session('warning_message') }}
        </div>
    @endif
@endsection
