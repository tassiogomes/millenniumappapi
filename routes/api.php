<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApiController;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::get('login/{id}',[ApiController::class, 'showLogin']);
Route::post('register', [ApiController::class, 'register']);
Route::post('users/{id}/simulacoes', [ApiController::class, 'createSimulacao']);
Route::get('users/{userId}/simulacoes/{simulacaoId}', [ApiController::class, 'showSimulacao']);
    
/*Route::post('simulacoes', [ApiController::class, 'createSimulacao']);
Route::get('users/{id}/simulacoes', [UserController::class, 'showSimulations']);*/






