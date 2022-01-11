<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UserController;

Route::group(['prefix' => 'users', ], function () {
    Route::post('/create',  [UserController::class, 'store']);
    Route::get('/{user}',  [UserController::class, 'show']);
});
