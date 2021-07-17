@extends('layouts.master')
@section('title', 'MANAGE DID')
@section('content')
<section class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1>@yield('title')</h1>
            </div>
            <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                    <li class="breadcrumb-item active">Manage DID</li>
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
            <h3 class="card-title">Manage DID</h3>
           
            <div class="card-tools">
               
                <a class="btn btn-tool btn-success" href="{{ route('acl.perms.manage') }}"> Create DID </a>
                <a class="btn btn-tool btn-success" href="{{ route('acl.perms.manage') }}"> Assign </a>
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
                        <th class="avatar">DID</th>
                        <th>Channels</th>
                        <th>Call Record</th>
                        <th>Status</th>
                        <th style="text-align: left;">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($DiDNumbers as $key => $didNumbers)
                        <tr>
                            <td class="serial">{{ $key + $DiDNumbers->firstItem()}}</td>
                            <td><span class="name">{{ $didNumbers->pri }}</span></td>
                            <td> <span class="product">{{ $didNumbers->channel }}</span> </td>
                            
                             <td> @if($didNumbers->call_record =='0')
                                    <span class="badge bg-danger">InActive</span>
                                @else($didNumbers->call_record =='1')
                                    <span class="badge bg-success">Active</span>
                                @endif</td>
                            <td> @if($didNumbers->status =='0')
                                    <span class="badge bg-danger">InActive</span>
                                @else($didNumbers->status =='1')
                                    <span class="badge bg-success">Active</span>
                                @endif </td>
                            <td style="text-align: left;"> 
                                <a href="#"><i class="fa fa-forward" data-original-title="" data-toggle="modal" data-target="#modal_{{ $didNumbers->id }}"></i></a>
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
                {!! $DiDNumbers->render() !!}
            </ul>
        </div>
    </div>
</section>
@forelse ($DiDNumbers as $key => $didNumbers)
<div class="modal fade" id="modal_{{ $didNumbers->id }}">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Forward DID!</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form class="form-horizontal" id="didNumForm_{{ $didNumbers->id }}" action="{{ route('web.did.manage') }}" method="post">
            <input type="hidden" name="_token" value="{{ csrf_token() }}">
            <input type="hidden" name="id" value="{{ Crypt::encryptString($didNumbers->id) }}">
            <div class="modal-body">
                <div class="card-body">
                    <div class="form-group row">
                    <label for="inputEmail3" class="col-sm-2 col-form-label">DID Number</label>
                        <div class="col-sm-10">
                          <input type="text" class="form-control" id="did_number" placeholder="DID Number" value="{{ $didNumbers->pri }}" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputPassword3" class="col-sm-2 col-form-label">Application</label>
                        <div class="col-sm-10">
                            <div class="form-group">
                                <select class="form-control" name="app_name" onchange="__appValue(this.value,{{ $didNumbers->id }})" id="app_name_{{ $didNumbers->id }}">
                                <option value=""></option>
                                @foreach($applications as $application)
                                    <option value="{{ $application->table_name }},{{ $application->app_name }}">{{ $application->display_name }} </option>
                                @endforeach
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputPassword3" class="col-sm-2 col-form-label">App Value</label>
                        <div class="col-sm-10">
                            <div class="form-group">
                                <select class="form-control" name="app_value" id="app_value_{{ $didNumbers->id }}">
                                  <option value=""></option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="name" id="name_{{ $didNumbers->id }}">
                </div>
            </div>
            <div class="modal-footer">
                {{-- onclick="allowAccess()" --}}
                <button type="submit" class="btn btn-success" onclick="return accessValidation({{ $didNumbers->id }},event)" class="actionValidation">Accept</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal" >Close</button>
            </div>
            </form>
        </div>
    </div>
</div>
@empty
@endforelse
@endsection
<script type="text/javascript">
    
    function __appValue(name,did){

        $("#app_value_"+did).empty();
        $("#app_value_"+did).append("<option value=''></option>");
        names = name.split(",");
        let table_name  = names[0];
        $("#name_"+did).val(names[1]);
        user_id = '{{ Crypt::encryptString($user_id) }}';

        if(typeof  table_name !=='undefined' && table_name !='' && typeof user_id !='undefined'){

            $.ajax(
                {
                    url: '{{ route('web.did.appvalue.ajax') }}',
                    dataType: 'json', // what to expect back from the PHP script
                    cache: false,
                    data: { _token: "{{ csrf_token() }}", app_name : table_name ,user_id: user_id },
                    type: 'POST',
                    beforeSend: function () {
                        $('#loading').show();
                    },
                    complete: function () {
                        $('#loading').hide();
                    },
                    success: function (result) {
                        $('#loading').hide();
                        if(result.success){
                            $.each(result.response, function(key,value) {
                                if(table_name ==='sip_peers'){
                                    name = value.agent_name; 
                                }else if(table_name ==='forward_application'){
                                    name = value.number;
                                }else {
                                    name = value.name;
                                }
                                $("#app_value_"+did).append("<option value='" + value.id + "'>" + name + "</option>");
                            });
                        }
                    },
                    error: function (response) {
                        console.log('Server error');
                    }
                }
            );
        }
    }
    function accessValidation(id,e){
        //prevent submit
        e.preventDefault();
        var app_name = $('#name_'+id).val(); //application name
        var app_value = $('#app_value_'+id).val(); //application value
        i= 0;
        if(typeof  app_name ==='undefined' || app_name ==''){
            $("#app_name_"+id).css('border',"red solid 1px");
            $("#app_name_"+id).css('border',"red solid 1px");
            i++;
        }else{
            $("#app_name_"+id).removeAttr("style");
        }
        if(app_name =='voicemail' || app_name =='hangup'){
            $("#app_value_"+id).removeAttr("style");
        }else{
            if(app_value ==''){
                $("#app_value_"+id).css('border',"red solid 1px");
                $("#app_value_"+id).css('border',"red solid 1px");
                i++;
            }else{
                $("#app_value_"+id).removeAttr("style");
            }
        }
        //validation check
        if(i==0){
            document.getElementById('didNumForm_'+id).submit();
            return true;
        }else{
            return false;
        }
    }
</script>