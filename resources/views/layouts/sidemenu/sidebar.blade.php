<!-- Sidebar -->
<div class="sidebar">
    <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <li class="nav-item">
                <a href="{{ route('web.home') }}" class="nav-link {{ (Route::is('home') ? 'active' : '') }}">
                    <i class="nav-icon fas fa-tachometer-alt"></i>
                    <p> Dashboard </p>
                </a>
            </li>
            @permission(('acl.*'))
            <li class="nav-item {{ (Route::is('acl.*') ? 'menu-open' : '') }}">
                <a href="#" class="nav-link {{ (Route::is('acl.*') ? 'active' : '') }}">
                    <i class="nav-icon fab fa fa-unlock-alt"></i>
                    <p>
                        Role Management
                        <i class="fas fa-angle-left right"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item">
                        <a href="{{ route('acl.role.view') }}" class="nav-link {{ (Route::is('acl.role.view') ? 'active' : '' ) }} ">
                            <i class="far fa-dot-circle nav-icon"></i>
                            <p>List Role</p>
                        </a>
                    </li>
                    @permission('acl.perms.view')
                        <li class="nav-item">
                            <a href="{{ route('acl.perms.view') }}" class="nav-link {{ (Route::is('acl.perms.view') ? 'active' : '' ) }} ">
                                <i class="far fa-dot-circle nav-icon"></i>
                                <p>List Permission</p>
                            </a>
                        </li>
                    @endpermission
                </ul>
            </li>
            @endpermission
        </ul>
    </nav>
</div>