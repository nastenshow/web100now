<?php

    return [

        // Panel Credential
        'username'          => env('WEB100NOW_USERNAME', 'administrator'),
        'password'          => env('WEB100NOW_PASSWORD', '12345678'),

        // JWT Settings
        'jwt_secret'        => env('JWT_SECRET', env('APP_KEY')),
        'jwt_access'        => env('JWT_ACCESS', 900),
        'jwt_refresh'       => env('JWT_REFRESH', 7200),

        // Custom Vars
        'name'              => env('WEB100NOW_NAME', 'Web100Now Control Panel'),
        'website'           => env('WEB100NOW_WEBSITE', 'https://web100now.sh'),
        'activesetupcount'  => env('WEB100NOW_ACTIVESETUPCOUNT', 'https://service.web100now.sh/setupcount'),
        'documentation'     => env('WEB100NOW_DOCUMENTATION', 'https://web100now.sh/docs.html'),
        'app'               => env('WEB100NOW_APP', 'https://play.google.com/store/apps/details?id=it.christiangiupponi.web100now'),

        // Global Settings
        'users_prefix'      => env('WEB100NOW_USERS_PREFIX', 'cp'),
        'phpvers'           => ['8.1','8.0','7.4'],
        'services'          => ['nginx','php','mysql','redis','supervisor'],
        'default_php'       => '8.0',

    ];
