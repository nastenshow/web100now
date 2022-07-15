<h1>Hi Folks! I'm a little late but I'm working on Web100Now 4 and it will be released on 27th July 2022!</h1>
<h2>It will be based on Laravel 9 and Livewire, it will support Ubuntu 22.04, authentication will be provider by Laravel Jetstream and Laravel Sanctum, and many other changes</h2>

<img src="https://github.com/andreapollastri/web100now/blob/master/utility/design/banner.png?raw=true">

![GitHub stars](https://img.shields.io/github/stars/andreapollastri/web100now?style=social)
![GitHub watchers](https://img.shields.io/github/watchers/andreapollastri/web100now?style=social)
![GitHub issues](https://img.shields.io/github/issues/andreapollastri/web100now)
![GitHub](https://img.shields.io/github/license/andreapollastri/web100now)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/andreapollastri/web100now?label=version)

## About
Web100Now is a Laravel based cloud server control panel that supports Digital Ocean, AWS, Vultr, Google Cloud, Linode, Azure and other VPS. It comes with nginx, Mysql, multi PHP-FPM versions, multi users, Supervisor, Composer, npm, free Let's Encrypt certificates, Git deployment, backups, ffmpeg, fail2ban, Redis, API and with a simple graphical interface useful to manage Laravel, Codeigniter, Symfony, WordPress or other PHP applications. With Web100Now you don’t need to be a Sys Admin to deploy and manage websites and PHP applications powered by cloud VPS.

## Features
- Easy install: setup one or more servers with a click in few minutes without be a Linux expert.

- Server Management: manage one or more servers in as easy as a few clicks without be a LEMP Guru.

- Perfect stack for PHP devs: Web100Now comes with nginx, PHP, MySql, Composer, npm and Supervisor.

- Multi-PHP: Run simultaneous PHP versions at your ease & convenience.

- Secure: no unsed open ports, unprivileged PHP, isolated system users and filesystem, only SFTP (no insecure FTP), Free SSL certificates everywhere.

- Always update: Web100Now takes care about your business and automatically keeps your server's software up to date so you always have the latest security patches.

- Integrate Web100Now with your own software via Rest API and Swagger.

- Real-time servers stats: Keep an eye on everything through an awesome dashboard.

- Always up to date: Web100Now installs last versions of LTS dists and supports Ubuntu 20.04 LTS :)

## Discover Web100Now
Visit website: https://web100now.sh

## Documentation
Web100Now Documentation is available at: https://web100now.sh/docs.html.

## Installation
```bash
wget -O - https://web100now.sh/go.sh | bash
```
#### Installation on AWS
AWS by default disables root login. To login as root inside AWS, login as default user and then use command sudo -s.

```
$ ssh ubuntu@<your server IP address>
$ ubuntu@aws:~$ sudo -s
$ root@aws:~# wget -O - https://web100now.sh/go.sh | bash
```
Remember to open ports: 22, 80 and 443!

#### Installation Note
Before you can use Web100Now, please make sure your server fulfils these requirements:

- Ubuntu 20.04 x86_64 LTS (Fresh installation)
- If the server is virtual (VPS), OpenVZ may not be supported
- We are checking Web100Now compatibility within Oracle / ARM (not full supported yet)

Hardware Requirement: More than 1GB of HD / At least 1 core processor / 512MB minimum RAM / At least 1 public IP  Address (IPv6 and NAT VPS are not supported) / For VPS providers such as AWS, those providers already include an external firewall for your VPS. Please open port 22, 80 and 443 to install Web100Now.

Installation may take up to about 30 minutes which may also depend on your server's internet speed. After the installation is completed, you are ready to use Web100Now to manage your servers.

To correctly manage remote servers Web100Now has to be on a public IP address (IPv4). Do not use it in localhost!

## Web100Now LEMP environment
- nginx: 1.18
- PHP-FPM: 8.1, 8.0, 7.4
- MySql: 8
- node: 16
- npm: 8
- Composer: 2

## Screenshots

<img src="https://web100now.sh/assets/images/docs/dashboard.png"> 

<img src="https://web100now.sh/assets/images/docs/server.png"> 

<img src="https://web100now.sh/assets/images/docs/site.png"> 

## Why use Web100Now?
Web100Now is easy, stable, powerful and free for any personal and commercial use and it's a perfect alternative to Runcloud, Ploi.io, Serverpilot, Forge, Moss.sh and similar software...

## Mobile App
Christian Giupponi (https://zerouno.io) has developed the Web100Now Mobile App.<br>
Android: https://play.google.com/store/apps/details?id=it.christiangiupponi.web100now<br>
iOS: Coming soon!<br><br>

## Web100Now Roadmap... what's next? 
- Web100Now Version 4 (half 2022)
- Laravel 9 support
- Backup on s3
- Apps installer
- ...

## Contributing
Thank you for considering contributing to the Web100Now Project (code, issues, feedbacks, stars, promo, beers) :)

#### ...anyway star this project on Github, Thankyou ;)

## Licence
Web100Now is an open-source software licensed under the MIT license.

## Need support with Web100Now?
Please open an issue here: https://github.com/andreapollastri/web100now/issues.

## Write to Web100Now
Write an email to: hello@web100now.sh

### ...enjoy Web100Now :)
# web100now
