<?php

namespace App\Http\Controllers\CSO\Indicator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class SinglePageController extends Controller
{
    //
    public function index() {
        return view('app');
    }
}