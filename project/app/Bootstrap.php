<?php

declare(strict_types=1);

namespace App;

use Nette\Bootstrap\Configurator;


class Bootstrap
{
	public static function boot(): Configurator
	{
		$configurator = new Configurator;
		$appDir = dirname(__DIR__);

		define('HOST_LOCAL', 'localhost');
		$host = current(explode(":", $_SERVER["HTTP_HOST"]));
		if($host === HOST_LOCAL)
			$configurator->setDebugMode(true);
		$configurator->enableTracy($appDir . '/log');

		$configurator->setTimeZone('Europe/Prague');
		$configurator->setTempDirectory($appDir . '/temp');

		$configurator->createRobotLoader()
			->addDirectory(__DIR__)
			->register();

		$configurator->addConfig($appDir . '/config/common.neon');
		if($host === HOST_LOCAL){
			$configurator->addConfig($appDir . '/config/environment/dev.neon');
		} else {
			$configurator->addConfig($appDir . '/config/environment/prod.neon');
		}

		return $configurator;
	}
}
