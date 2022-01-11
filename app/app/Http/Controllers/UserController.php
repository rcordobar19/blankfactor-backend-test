<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserRequest;
use Exception;
use App\Models\User;

class UserController extends Controller
{
    public function show($userId)
    {
        try {
            $user = User::findOrFail($userId);

            return response()->json([
                'success' => true,
                'user' => $user,
            ]);
        } catch (Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage()
            ]);
        }
    }

    public function store(UserRequest $request)
    {
        try {
            $user = User::create($request->validated());

            return response()->json([
                'success' => true,
                'message' => 'User created',
                'user' => $user,
            ]);
        } catch (Exception $e) {
            return response()->json([
                'success' => false,
                'message' => $e->getMessage(),
            ]);
        }
    }
}
