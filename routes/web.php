<?php

use App\Http\Controllers\PostController;
use Illuminate\Support\Facades\Route;

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

// test
Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth'])->name('dashboard');

require __DIR__.'/auth.php';

Route::get('/posts/create', [PostController::class, 'create'])->name('posts.create')->middleware('permission:write post');
Route::get('/posts/{post}/edit', [PostController::class, 'edit'])->name('posts.edit')->middleware('role:editor|admin');

Route::get('/roles/index', [RoleController::class, 'index'])->name('roles.index');

Route::get('/clear-cache-all', function() {
    Artisan::call('cache:clear');
  
    dd("Cache Clear All");
});
