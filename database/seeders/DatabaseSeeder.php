<?php

namespace Database\Seeders;

use App\Models\Auth;
use App\Models\Server;
use Illuminate\Support\Str;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        Auth::query()->truncate();

        Auth::create([
            'username' => config('web100now.username'),
            'password' => Hash::make(config('web100now.password')),
            'apikey' => Str::random(48)
        ]);

        Server::create([
            'server_id' => strtolower('WEB100NOWSERVERID'),
            'name' => 'This VPS!',
            'ip' => 'WEB100NOWIP',
            'password' => strtolower('WEB100NOWPASS'),
            'database' => strtolower('WEB100NOWDB'),
            'default' => 1,
            'cron' => ' '
        ]);

        return true;
    }
}
