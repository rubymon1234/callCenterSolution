@extends('layouts.master')
@section('title', 'Role Management')
@section('content')
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>@yield('title') :: Assign Permission</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                    <li class="breadcrumb-item active"> Assign Permission</li>
                </ol>
            </div>
        </div>
    </div>
</section>
<!-- Main content -->
<section class="content">
    <div class="card card-info col-sm-12">
        <div class="card-header">
            <h3 class="card-title">Assign Permission </h3>
        </div>
        <?php $assignRole  = array(); ?>
        @foreach($role_permissions as $assignrole)
            <?php  $assignRole[] = $assignrole->id; ?> 
        @endforeach
        <div class="card-body--">
            <div class="table-stats order-table ov-h">
                <form role="form" method="post" action="">
                    {{ csrf_field() }}
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="serial">Check</th>
                                <th class="avatar">Name</th>
                                <th>Display Name</th>
                                <th style="text-align: left;">Description</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($permissions as $key=>$role_perms)
                                <tr>
                                    <td class="serial"><input type="checkbox" name="permissn[]" class="" id="check1" value="{{ $role_perms->id }}" <?php 
                                if (in_array($role_perms->id, $assignRole)) { ?>
                                    checked=checked
                                <?php } ?>> </td>
                                    <td>  <span class="name">{{ $role_perms->name }}</span> </td>
                                    <td> <span class="product">{{ $role_perms->display_name }}</span> </td>
                                    <td style="text-align: left;"> {{ $role_perms->description }} </td>
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="6"> No Permission in the list... for now! </td>
                                </tr>
                            @endforelse
                        </tbody>
                    </table>
                    <div class="card-body">
                        <button type="submit" class="btn btn-danger pull-right" name="Cancel" value="cancel">Cancel</button>&nbsp;
                        <button type="submit" class="btn btn-info pull-right" style="margin-right: 10px;" name="Update" value="Save">Update</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
@endsection