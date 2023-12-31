<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInitb0de4abdb1a4370877514417035c574d
{
    public static $prefixLengthsPsr4 = array (
        'Z' => 
        array (
            'Zadarma_API\\' => 12,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Zadarma_API\\' => 
        array (
            0 => __DIR__ . '/..' . '/zadarma/user-api-v1/lib',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInitb0de4abdb1a4370877514417035c574d::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInitb0de4abdb1a4370877514417035c574d::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInitb0de4abdb1a4370877514417035c574d::$classMap;

        }, null, ClassLoader::class);
    }
}
