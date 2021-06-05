<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::post('/login', 'Auth\AuthController@login')->name('login');
Route::get('/login', 'Auth\AuthController@index')->name('login');
Route::get('/', 'Auth\AuthController@index')->name('base');

Route::group(['middleware' => 'auth','prefix' =>'admin'], function () {
	Route::get('home', 'Auth\AuthController@homelanding')->name('web.home');
	Route::post('logout', 'Auth\LoginController@logout')->name('logout');
	Route::get('logout', 'Auth\LoginController@logout')->name('logout');

	// ACL - Roles and Permissions
	Route::get('/role/view', 'Acl\AclController@getViewRole')->name('acl.role.view')->middleware(['permission:acl.role.view']);
	Route::get('/role/create', 'Acl\AclController@getCreateRole')->name('acl.role.manage')->middleware(['permission:acl.role.view']);
	Route::post('/role/create', 'Acl\AclController@postCreateRole')->name('acl.role.manage')->middleware(['permission:acl.role.view']);

	//ASSIGN PERMISSION TO ROLES
	Route::get('role/assign/permissions/{id}', 'Acl\AclController@getPermissionAssign')->name('assign.role.permission')->middleware(['permission:assign.role.permission']);
	Route::post('role/assign/permissions/{id}', 'Acl\AclController@postPermissionAssign')->name('assign.role.permission')->middleware(['permission:assign.role.permission']);

	Route::get('/viewers/listing', 'Admin\UserViewController@getViewerDetail')->name('admin.viewer')->middleware(['permission:admin.viewer']);

	//Permission
	Route::get('/permission/view', 'Acl\AclController@getViewPerms')->name('acl.perms.view');
	Route::get('/permission/create', 'Acl\AclController@getCreatePerms')->name('acl.perms.manage');
	Route::post('/permission/create', 'Acl\AclController@postCreatePerms')->name('acl.perms.manage');
	Route::get('/permission/edit/{id}','Acl\AclController@getEditPerms')->name('acl.perms.edit');
	Route::post('/permission/edit/{id}','Acl\AclController@postEditPerms')->name('acl.perms.edit');
	Route::get('/permission/del/{id}','Acl\AclController@getDelPerms')->name('acl.perms.delete');
	// Errors
	Route::get('/permission/denid/403', 'Web\HomeController@accessDenied')->name('accessDenied');
});

