@extends('layouts.master')
@section('title', 'Role Management')
@section('content')
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>@yield('title') :: List Permission</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                    <li class="breadcrumb-item active">List Permission</li>
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
            <h3 class="card-title">List Permission</h3>
           
            <div class="card-tools">
               
                 <a class="btn btn-tool btn-success" href="{{ route('acl.perms.manage') }}"> Add New Permission </a>
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
                        <th class="serial">#</th>
                        <th class="avatar">Permission Name</th>
                        <th>Display Name</th>
                        <th>Description</th>
                        <th style="text-align: left;">Manage</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($perms as $key=>$perm)
                        <tr>
                            <td class="serial">{{ $key + $perms->firstItem()}}</td>
                            <td> <span class="name">{{ $perm->name }}</span> </td>
                            <td> <span class="product">{{ $perm->display_name }}</span> </td>
                            <td> {{ $perm->description }} </td>
                            <td style="text-align: left;"> 
                                <a href="{{ route('acl.perms.edit' ,$perm->id) }}"><i class="fa fa-edit" data-toggle="tooltip" data-original-title="Edit Permission" ></i></a>&nbsp;&nbsp;
                                <a href="" id="dou_conf_{{ $perm->id }}">
                                <i class="fa fa-trash" data-toggle="tooltip" data-original-title="Delete Permission" onclick="doubleConfirm({{ $perm->id }},'{{ route('acl.perms.delete',$perm->id) }}')">
                                 </i></a>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="6"> No Permission in the list... for now! </td>
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
<script type="text/javascript">
    function doubleConfirm(permission_id,url){
        if (confirm('Are you sure you want to permanently delete this permission ?')){
           jQuery('#dou_conf_'+permission_id).attr('href',url);
        }
    }
</script>
@endsection