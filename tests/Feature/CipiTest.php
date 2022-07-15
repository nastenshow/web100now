<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class Web100NowTest extends TestCase
{

    public function testShowLoginPage()
    {
        $response = $this->get('/login');
        $response->assertSee('Web100Now Control Panel');
        $response->assertStatus(200);
    }

}
