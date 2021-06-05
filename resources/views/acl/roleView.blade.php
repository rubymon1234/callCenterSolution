@extends('layouts.master')
@section('title', 'Role Management')
@section('content')
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>@yield('title') :: List Roles</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                    <li class="breadcrumb-item active">List Roles</li>
                </ol>
            </div>
        </div>
    </div>
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
</section>
<!-- Main content -->
<section class="content">
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Role</h3>
           
            <div class="card-tools">
               
                 <a class="btn btn-tool btn-success" href="{{ route('acl.role.manage') }}"> Add New Role </a>
                <!-- <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                    <i class="fas fa-minus"></i>
                </button>
                <button type="button" class="btn btn-tool" data-card-widget="remove" title="Remove">
                    <i class="fas fa-times"></i>
                </button> -->
            </div>
        </div>
        <div class="card-body">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th style="width: 10px">#</th>
                        <th>Role Name</th>
                        <th>Name</th>
                        <th>Description</th>
                        {{-- <th>Status</th> --}}
                        <th style="width: 40px">Manage</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($roles as $key=>$role)
                        <tr>
                            <td class="serial">{{ $key + $roles->firstItem()}}</td>
                            <td>  <span class="name">{{ $role->name }}</span> </td>
                            <td> <span class="product">{{ $role->display_name }}</span> </td>
                            <td> {{ $role->description }} </td>
                            <td style="text-align: left;">
                                <span class="btn btn-primary">
                                    <a href="{{ route('assign.role.permission', $role->id) }}" style="color: white;"> Manage Permissions</a></span>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="6"> No Role in the list... for now! </td>
                        </tr>
                    @endforelse
                </tbody>
            </table>
        </div>
        <!-- pagination -->
        <div class="card-footer clearfix">
            <ul class="pagination pagination-sm m-0 float-right">
                {{-- {!! $categoryDetail->render() !!} --}}
            </ul>
        </div>
    </div>
</section>
@endsection