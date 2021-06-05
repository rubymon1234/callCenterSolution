@extends('layouts.master')
@section('title', 'Role Management')
@section('content')
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>@yield('title') :: Add Role</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                    <li class="breadcrumb-item active">Add Role</li>
                </ol>
            </div>
        </div>
    </div>
</section>
<!-- Main content -->
<section class="content">
    <div class="card card-info col-sm-6">
        <div class="card-header">
            <h3 class="card-title">Add Role</h3>
        </div>
        <form role="form" action="" method="post" class="form-horizontal">
            {{ csrf_field() }}
            <div class="tab-pane fade active show" id="custom-nav-home" role="tabpanel" aria-labelledby="custom-nav-home-tab">
                <div class="row form-group">
                    <div class="col-12">
                        <label for="text-input" class=" form-control-label">Name</label>
                    </div>
                    <div class="col-8">
                        <input type="text" name="name" class="form-control" placeholder="Enter Role Name." value="{{ old('name') }}">
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-12">
                        <label for="text-input" class=" form-control-label">Display Name</label>
                    </div>
                    <div class="col-8">
                        <input type="text" name="display_name" class="form-control" placeholder="Enter Display Name." value="{{ old('display_name') }}">
                    </div>
                </div>
                 <div class="row form-group">
                    <div class="col-12">
                        <label for="text-input" class=" form-control-label">Description</label>
                    </div>
                    <div class="col-8">
                        <input type="text" name="description" class="form-control" placeholder="Enter Description." value="{{ old('description') }}">
                    </div>
                </div>
                <div class="box-footer">
                    @if ($errors->any())
                        <label class="control-label" for="inputError" style="color: #dd4b39"><i class="fa fa-times-circle-o" ></i> {{ implode(' | ', $errors->all(':message')) }} .</label>
                    @endif
                    <button type="submit" class="btn btn-danger pull-right" name="Cancel" value="cancel">Cancel</button>&nbsp;
                    <button type="submit" class="btn btn-info pull-right" style="margin-right: 10px;" name="Update" value="Save">Create</button>
                </div>
            </div>
        </form>
    </div>
</section>
<style type="text/css">
    .form-horizontal{
        padding: 10px;
    }
</style>
@endsection
