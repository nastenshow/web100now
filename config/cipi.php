<?php

    return [

        // Panel Credential
        'username'          => env('CIPI_USERNAME', 'administrator'),
        'password'          => env('CIPI_PASSWORD', '12345678'),

        // JWT Settings
        'jwt_secret'        => env('JWT_SECRET', env('APP_KEY')),
        'jwt_access'        => env('JWT_ACCESS', 900),
        'jwt_refresh'       => env('JWT_REFRESH', 7200),

        // Custom Vars
        'name'              => env('CIPI_NAME', 'Web100Now Control Panel'),
        'website'           => env('CIPI_WEBSITE', 'https://web100now.sh'),
        'activesetupcount'  => env('CIPI_ACTIVESETUPCOUNT', 'https://service.web100now.sh/setupcount'),
        'documentation'     => env('CIPI_DOCUMENTATION', 'https://web100now.sh/docs.html'),
        'app'               => env('CIPI_APP', 'https://play.google.com/store/apps/details?id=it.christiangiupponi.web100now'),

        // Global Settings
        'users_prefix'      => env('CIPI_USERS_PREFIX', 'cp'),
        'phpvers'           => ['8.1','8.0','7.4'],
        'services'          => ['nginx','php','mysql','redis','supervisor'],
        'default_php'       => '8.0',

    ];
