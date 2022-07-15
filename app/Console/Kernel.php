<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        \App\Console\Commands\ActiveSetupCount::class,
        \App\Console\Commands\LogRotate::class,
        \App\Console\Commands\ServerSetupCheck::class,
        \App\Console\Commands\Web100NowUpdate::class,
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        $schedule->command('servers:setupcheck')->everyMinute();
        $schedule->command('web100now:update')->dailyAt('12:05');
        $schedule->command('web100now:logrotate')->dailyAt('00:00');
        $schedule->command('web100now:activesetupcount')->dailyAt('03:03');
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');
        require base_path('routes/console.php');
    }
}
