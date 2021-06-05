<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>@yield('title') :: {{ config('app.name', 'CallCenterApp') }}</title>

    <link rel="icon" href="{{ asset('assets/call_center_app_logo.png') }}" type="image/gif" sizes="16x16">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="{{ asset('assets/plugins/fontawesome-free/css/all.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/dist/css/adminlte.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/dist/css/dc_custom.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/plugins/select2/css/select2.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css') }}">
</head>
<body class="hold-transition sidebar-mini">
    <div class="wrapper">
        <!-- Navbar -->
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" data-widget="fullscreen" href="javascript:void(0)" role="button">
                        <i class="fas fa-expand-arrows-alt"></i>
                    </a>
                </li>
              <li class="dropdown user user-menu open">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                        <img src="{{ asset('assets/call_center_app_logo.png') }}" class="user-image logoutImg" alt="User Image">
                        <span class="text-muted text-s">{{ Auth::user()->name }}</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="user-header">
                            <img src="{{ asset('assets/call_center_app_logo.png') }}" class="img-circle" alt="User Image">
                            <p>
                                {{ Auth::user()->name }} - Admin
                                <small>{{ Auth::user()->email }} </small>
                            </p>
                        </li>
                        <li class="user-footer">
                            <div class="pull-right logoutRightAlign">
                                <a class="btn btn-primary btn-flat" href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">{{ __('Logout') }}
                                </a>
                                <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                    <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                </form>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- navbar ends here-->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <a href="{{ route('web.home') }}" class="brand-link">
                <img src="{{ asset('assets/call_center_app_logo.png') }}" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
                <span class="brand-text font-weight-light"> Call Center App </span>
            </a>
            <!-- Sidemenu !-->
            @include('layouts.sidemenu.sidebar')
        </aside>

        <div class="content-wrapper">
            <!-- Dynamic Content !-->
            <div id="loading" style="display:none;"></div>
            @yield('content')
        </div>
        
        <footer class="main-footer">
            <strong>Copyright &copy; 2014 -{{ date('Y')}} <a href="#"> CallCenter Technologies </a></strong> All rights reserved.
        </footer>
    </div>
    <script src="{{ asset('assets/plugins/jquery/jquery.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/select2/js/select2.full.min.js') }}"></script>
    <script src="{{ asset('assets/dist/js/adminlte.min.js') }}"></script>
    <script src="{{ asset('assets/dist/js/demo.js') }}"></script>
    <script>
    $(function () {
        $('.select2').select2();
        $('.select2bs4').select2({
          theme: 'bootstrap4'
        })
    });
</script>
</body>
</html>
