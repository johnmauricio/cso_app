<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Laravel</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons" rel="stylesheet">
    {{--        <link href="https://cdn.jsdeliver.net/npm/vuetify/dist/vuetify.min.css" rel="stylesheet">--}}
    <link href="{{ asset('css/app.css') }}"/>

</head>
<body>
<div id="app">
    @yield('content')
</div>

<script src="{{ asset('js/app.js') }}"></script>
</body>
</html>
