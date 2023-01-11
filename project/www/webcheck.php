<?php
header('Content-Type:text/plain; charset=UTF-8');


$rootDir = __DIR__."/..";

$disr = [
    __DIR__."/temp" => "0777",
    __DIR__."/log" => "0777",
];


function logInfo(string $msg, $type = "INFO") {
    echo $type . ": ".$msg."\n";
}

// check if required dir exists
foreach($disr as $dir => $permission) {
    if(!is_dir($dir)) {
        logInfo("Directory '$dir' does not exist. Trying to create ...");
        mkdir($dir, $permission);
        if(!is_dir($dir)) {
            logInfo("Unable to create directory '$dir'.", "FATAL");
            exit();
        }
    }
}

logInfo("Test dir OK");

// check if root dir is protected
if(!file_exists($rootDir."/.htaccess")) {
    logInfo(".htaccess file which protect root dir does not exists.");
}

logInfo("Test protection OK");




