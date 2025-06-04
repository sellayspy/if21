<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\FakultasController;
use App\Http\Controllers\JadwalController;
use App\Http\Controllers\MahasiswaController;
use App\Http\Controllers\MataKuliahController;
use App\Http\Controllers\ProdiController;
use App\Http\Controllers\SesiController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return redirect('/dashboard');
});

Route::resource('/fakultas', FakultasController::class);
Route::resource('/prodi', ProdiController::class);
Route::resource('/user', UserController::class);
Route::resource('/mahasiswa', MahasiswaController::class);
Route::resource('/sesi', SesiController::class);
Route::resource('/jadwal', JadwalController::class);
Route::resource('/mata_kuliah', MataKuliahController::class);

Route::get('/dashboard', [DashboardController::class, 'index']);
