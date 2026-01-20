<?php

namespace Netforma\Collapser;

use Statamic\Providers\AddonServiceProvider;
use Netforma\Collapser\Fieldtypes\Collapser as CollapserFieldtype;

class ServiceProvider extends AddonServiceProvider
{
    protected $fieldtypes = [
        CollapserFieldtype::class,
    ];

    protected $vite = [ 
        'input' => [
            'resources/js/cp.js',
            'resources/css/cp.css',
        ],
        'publicDirectory' => 'resources/dist',
    ]; 
}