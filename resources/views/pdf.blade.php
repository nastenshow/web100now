<!DOCTYPE html>
<html>
<head>
    <title>{{ $domain }}</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }
    </style>
</head>
<body>
	<center>
		<h4>{{ strtoupper(__('web100now.site')) }}</h4>
		<h1>{{ $domain }}</h1>
    </center>
	<br>
    <h3>SSH/SFTP</h3>
	<ul>
		<li><b>{{ __('web100now.host') }}</b> {{$ip}}</li>
		<li><b>{{ __('web100now.port') }}</b> 22</li>
		<li><b>{{ __('web100now.username') }}</b> {{$username}}</li>
        <li><b>{{ __('web100now.password') }}</b> {{$password}}</li>
        <li><b>{{ __('web100now.path') }}</b> /home/{{ $username }}/web/{{ $path }}</li>
	</ul>
	<br>
	<hr>
	<br>
	<h3>{{ __('web100now.database') }}</h3>
	<ul>
		<li><b>{{ __('web100now.host') }}</b> 127.0.0.1</li>
		<li><b>{{ __('web100now.port') }}</b> 3306</li>
		<li><b>{{ __('web100now.username') }}</b> {{$username}}</li>
		<li><b>{{ __('web100now.password') }}</b> {{$dbpass}}</li>
		<li><b>{{ __('web100now.name') }}</b> {{$username}}</li>
    </ul>
    <br>
	<hr>
    <br>
    <center>
        <p>{!! __('web100now.pdf_site_php_version', ['domain' => $domain, 'php' => $php]) !!}</p>
    </center>
    <br>
	<center>
		<p>{{ __('web100now.pdf_take_care') }}</p>
	</center>
    <br>
    <br>
	<br>
	<center>
		<h5>{{ config('web100now.name') }}<br>({{ config('web100now.website') }})</h5>
	</center>
</body>
</html>
