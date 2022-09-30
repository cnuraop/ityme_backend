<?php return array (
  'analytics' => 
  array (
    'google-analytics' => 'UA-XXXXX-X',
  ),
  'app' => 
  array (
    'name' => 'iTyme',
    'env' => 'local',
    'debug' => true,
    'debug_emails' => NULL,
    'url' => 'https://admin.ityme.in',
    'timezone' => 'UTC',
    'locale' => 'en',
    'fallback_locale' => 'en',
    'locales' => 'en',
    'key' => 'base64:eYMEeRpmD6qFhYas5L7MfZlg6jjhPUqRVjC6kY2vvfY=',
    'cipher' => 'AES-256-CBC',
    'providers' => 
    array (
      0 => 'Illuminate\\Auth\\AuthServiceProvider',
      1 => 'Illuminate\\Broadcasting\\BroadcastServiceProvider',
      2 => 'Illuminate\\Bus\\BusServiceProvider',
      3 => 'Illuminate\\Cache\\CacheServiceProvider',
      4 => 'Illuminate\\Foundation\\Providers\\ConsoleSupportServiceProvider',
      5 => 'Illuminate\\Cookie\\CookieServiceProvider',
      6 => 'Illuminate\\Database\\DatabaseServiceProvider',
      7 => 'Illuminate\\Encryption\\EncryptionServiceProvider',
      8 => 'Illuminate\\Filesystem\\FilesystemServiceProvider',
      9 => 'Illuminate\\Foundation\\Providers\\FoundationServiceProvider',
      10 => 'Illuminate\\Hashing\\HashServiceProvider',
      11 => 'Illuminate\\Mail\\MailServiceProvider',
      12 => 'Illuminate\\Notifications\\NotificationServiceProvider',
      13 => 'Illuminate\\Pagination\\PaginationServiceProvider',
      14 => 'Illuminate\\Pipeline\\PipelineServiceProvider',
      15 => 'Illuminate\\Queue\\QueueServiceProvider',
      16 => 'Illuminate\\Redis\\RedisServiceProvider',
      17 => 'Illuminate\\Auth\\Passwords\\PasswordResetServiceProvider',
      18 => 'Illuminate\\Session\\SessionServiceProvider',
      19 => 'Illuminate\\Translation\\TranslationServiceProvider',
      20 => 'Illuminate\\Validation\\ValidationServiceProvider',
      21 => 'Illuminate\\View\\ViewServiceProvider',
      22 => 'Laravel\\Tinker\\TinkerServiceProvider',
      23 => 'Collective\\Html\\HtmlServiceProvider',
      24 => 'Laravel\\Socialite\\SocialiteServiceProvider',
      25 => 'App\\Providers\\AppServiceProvider',
      26 => 'App\\Providers\\EventServiceProvider',
      27 => 'App\\Providers\\RouteServiceProvider',
    ),
    'aliases' => 
    array (
      'App' => 'Illuminate\\Support\\Facades\\App',
      'Artisan' => 'Illuminate\\Support\\Facades\\Artisan',
      'Auth' => 'Illuminate\\Support\\Facades\\Auth',
      'Blade' => 'Illuminate\\Support\\Facades\\Blade',
      'Broadcast' => 'Illuminate\\Support\\Facades\\Broadcast',
      'Bus' => 'Illuminate\\Support\\Facades\\Bus',
      'Cache' => 'Illuminate\\Support\\Facades\\Cache',
      'Config' => 'Illuminate\\Support\\Facades\\Config',
      'Cookie' => 'Illuminate\\Support\\Facades\\Cookie',
      'Crypt' => 'Illuminate\\Support\\Facades\\Crypt',
      'DB' => 'Illuminate\\Support\\Facades\\DB',
      'Eloquent' => 'Illuminate\\Database\\Eloquent\\Model',
      'Event' => 'Illuminate\\Support\\Facades\\Event',
      'File' => 'Illuminate\\Support\\Facades\\File',
      'Gate' => 'Illuminate\\Support\\Facades\\Gate',
      'Hash' => 'Illuminate\\Support\\Facades\\Hash',
      'Lang' => 'Illuminate\\Support\\Facades\\Lang',
      'Log' => 'Illuminate\\Support\\Facades\\Log',
      'Mail' => 'Illuminate\\Support\\Facades\\Mail',
      'Notification' => 'Illuminate\\Support\\Facades\\Notification',
      'Password' => 'Illuminate\\Support\\Facades\\Password',
      'Queue' => 'Illuminate\\Support\\Facades\\Queue',
      'Redirect' => 'Illuminate\\Support\\Facades\\Redirect',
      'Redis' => 'Illuminate\\Support\\Facades\\Redis',
      'Request' => 'Illuminate\\Support\\Facades\\Request',
      'Response' => 'Illuminate\\Support\\Facades\\Response',
      'Route' => 'Illuminate\\Support\\Facades\\Route',
      'Schema' => 'Illuminate\\Support\\Facades\\Schema',
      'Session' => 'Illuminate\\Support\\Facades\\Session',
      'Storage' => 'Illuminate\\Support\\Facades\\Storage',
      'URL' => 'Illuminate\\Support\\Facades\\URL',
      'Validator' => 'Illuminate\\Support\\Facades\\Validator',
      'View' => 'Illuminate\\Support\\Facades\\View',
      'Form' => 'Collective\\Html\\FormFacade',
      'Html' => 'Collective\\Html\\HtmlFacade',
      'Socialite' => 'Laravel\\Socialite\\Facades\\Socialite',
      'Excel' => 'Maatwebsite\\Excel\\Facades\\Excel',
    ),
  ),
  'auth' => 
  array (
    'models' => 
    array (
      'user' => 'Vtlabs\\Core\\Models\\User\\User',
    ),
    'resources' => 
    array (
      'admin' => 
      array (
        'user' => 'Vtlabs\\Core\\Http\\Resources\\Admin\\UserResource',
      ),
      'user' => 'Vtlabs\\Core\\Http\\Resources\\UserResource',
    ),
    'roles' => 
    array (
      0 => 'customer',
    ),
    'defaults' => 
    array (
      'guard' => 'web',
      'passwords' => 'users',
    ),
    'guards' => 
    array (
      'web' => 
      array (
        'driver' => 'session',
        'provider' => 'users',
      ),
      'api' => 
      array (
        'driver' => 'passport',
        'provider' => 'users',
      ),
    ),
    'providers' => 
    array (
      'users' => 
      array (
        'driver' => 'eloquent',
        'model' => 'Vtlabs\\Core\\Models\\User\\User',
      ),
    ),
    'passwords' => 
    array (
      'users' => 
      array (
        'provider' => 'users',
        'table' => 'password_resets',
        'expire' => 60,
      ),
    ),
    'users' => 
    array (
      'registration' => false,
      'default_role' => 'authenticated',
      'confirm_email' => false,
      'change_email' => false,
    ),
    'captcha' => 
    array (
      'registration' => false,
    ),
    'admin' => 
    array (
      'user_edit_disabled' => true,
    ),
  ),
  'broadcasting' => 
  array (
    'default' => 'null',
    'connections' => 
    array (
      'pusher' => 
      array (
        'driver' => 'pusher',
        'key' => NULL,
        'secret' => NULL,
        'app_id' => NULL,
        'options' => 
        array (
        ),
      ),
      'redis' => 
      array (
        'driver' => 'redis',
        'connection' => 'default',
      ),
      'log' => 
      array (
        'driver' => 'log',
      ),
      'null' => 
      array (
        'driver' => 'null',
      ),
    ),
  ),
  'cache' => 
  array (
    'default' => 'file',
    'stores' => 
    array (
      'apc' => 
      array (
        'driver' => 'apc',
      ),
      'array' => 
      array (
        'driver' => 'array',
      ),
      'database' => 
      array (
        'driver' => 'database',
        'table' => 'cache',
        'connection' => NULL,
      ),
      'file' => 
      array (
        'driver' => 'file',
        'path' => 'F:\\laravelpractice\\itymeBackend-master_final\\storage\\framework/cache/data',
      ),
      'memcached' => 
      array (
        'driver' => 'memcached',
        'persistent_id' => NULL,
        'sasl' => 
        array (
          0 => NULL,
          1 => NULL,
        ),
        'options' => 
        array (
        ),
        'servers' => 
        array (
          0 => 
          array (
            'host' => '127.0.0.1',
            'port' => 11211,
            'weight' => 100,
          ),
        ),
      ),
      'redis' => 
      array (
        'driver' => 'redis',
        'connection' => 'default',
      ),
    ),
    'prefix' => 'laravel',
  ),
  'captcha' => 
  array (
    'siteKey' => NULL,
    'secretKey' => NULL,
    'hideBadge' => false,
    'debug' => false,
  ),
  'constants' => 
  array (
    'mobile_number_length' => '10',
    'paginate_per_page' => 15,
    'demo_enabled' => false,
  ),
  'cors' => 
  array (
    'cors_profile' => 'Spatie\\Cors\\CorsProfile\\DefaultProfile',
    'default_profile' => 
    array (
      'allow_credentials' => false,
      'allow_origins' => 
      array (
        0 => '*',
      ),
      'allow_methods' => 
      array (
        0 => 'POST',
        1 => 'GET',
        2 => 'OPTIONS',
        3 => 'PUT',
        4 => 'PATCH',
        5 => 'DELETE',
      ),
      'allow_headers' => 
      array (
        0 => 'Content-Type',
        1 => 'X-Auth-Token',
        2 => 'Origin',
        3 => 'Authorization',
        4 => 'X-Localization',
        5 => 'X-Device-Id',
        6 => 'X-Device-Type',
      ),
      'expose_headers' => 
      array (
        0 => 'Cache-Control',
        1 => 'Content-Language',
        2 => 'Content-Type',
        3 => 'Expires',
        4 => 'Last-Modified',
        5 => 'Pragma',
      ),
      'forbidden_response' => 
      array (
        'message' => 'Forbidden (cors).',
        'status' => 403,
      ),
      'max_age' => 86400,
    ),
  ),
  'database' => 
  array (
    'default' => 'mysql',
    'connections' => 
    array (
      'sqlite' => 
      array (
        'driver' => 'sqlite',
        'database' => 'doctoworld',
        'prefix' => '',
      ),
      'mysql' => 
      array (
        'driver' => 'mysql',
        'host' => '127.0.0.1',
        'port' => '3306',
        'database' => 'doctoworld',
        'username' => 'root',
        'password' => 'root1316',
        'unix_socket' => '',
        'charset' => 'utf8mb4',
        'collation' => 'utf8mb4_unicode_ci',
        'prefix' => '',
        'strict' => true,
        'engine' => NULL,
      ),
      'pgsql' => 
      array (
        'driver' => 'pgsql',
        'host' => '127.0.0.1',
        'port' => '3306',
        'database' => 'doctoworld',
        'username' => 'root',
        'password' => 'root1316',
        'charset' => 'utf8',
        'prefix' => '',
        'schema' => 'public',
        'sslmode' => 'prefer',
      ),
    ),
    'migrations' => 'migrations',
    'redis' => 
    array (
      'client' => 'predis',
      'default' => 
      array (
        'host' => '127.0.0.1',
        'password' => NULL,
        'port' => 6379,
        'database' => 0,
      ),
    ),
  ),
  'debugbar' => 
  array (
    'enabled' => NULL,
    'except' => 
    array (
      0 => 'telescope*',
    ),
    'storage' => 
    array (
      'enabled' => true,
      'driver' => 'file',
      'path' => 'F:\\laravelpractice\\itymeBackend-master_final\\storage\\debugbar',
      'connection' => NULL,
      'provider' => '',
    ),
    'editor' => 'phpstorm',
    'remote_sites_path' => '',
    'local_sites_path' => '',
    'include_vendors' => true,
    'capture_ajax' => true,
    'add_ajax_timing' => false,
    'error_handler' => false,
    'clockwork' => false,
    'collectors' => 
    array (
      'phpinfo' => true,
      'messages' => true,
      'time' => true,
      'memory' => true,
      'exceptions' => true,
      'log' => true,
      'db' => true,
      'views' => true,
      'route' => true,
      'auth' => false,
      'gate' => true,
      'session' => true,
      'symfony_request' => true,
      'mail' => true,
      'laravel' => false,
      'events' => false,
      'default_request' => false,
      'logs' => false,
      'files' => false,
      'config' => false,
      'cache' => false,
      'models' => true,
    ),
    'options' => 
    array (
      'auth' => 
      array (
        'show_name' => true,
      ),
      'db' => 
      array (
        'with_params' => true,
        'backtrace' => true,
        'timeline' => false,
        'explain' => 
        array (
          'enabled' => false,
          'types' => 
          array (
            0 => 'SELECT',
          ),
        ),
        'hints' => true,
      ),
      'mail' => 
      array (
        'full_log' => false,
      ),
      'views' => 
      array (
        'data' => false,
      ),
      'route' => 
      array (
        'label' => true,
      ),
      'logs' => 
      array (
        'file' => NULL,
      ),
      'cache' => 
      array (
        'values' => true,
      ),
    ),
    'inject' => true,
    'route_prefix' => '_debugbar',
    'route_domain' => NULL,
    'theme' => 'auto',
    'debug_backtrace_limit' => 50,
  ),
  'dotenveditor' => 
  array (
    'pathToEnv' => 'F:\\laravelpractice\\itymeBackend-master_final\\.env',
    'backupPath' => 'F:\\laravelpractice\\itymeBackend-master_final\\resources\\backups/dotenv-editor/',
    'filePermissions' => 493,
    'activated' => true,
    'template' => 'adminlte::page',
    'overview' => 'dotenv-editor::overview-adminlte',
    'route' => 
    array (
      'namespace' => 'Brotzka\\DotenvEditor\\Http\\Controllers',
      'prefix' => 'admin/env',
      'as' => 'admin.env.',
      'middleware' => 
      array (
        0 => 'web',
        1 => 'admin',
      ),
    ),
  ),
  'eloquentfilter' => 
  array (
    'namespace' => 'App\\ModelFilters\\',
    'paginate_limit' => 15,
  ),
  'filesystems' => 
  array (
    'default' => 'public',
    'cloud' => 's3',
    'disks' => 
    array (
      'local' => 
      array (
        'driver' => 'local',
        'root' => 'F:\\laravelpractice\\itymeBackend-master_final\\storage\\app',
      ),
      'public' => 
      array (
        'driver' => 'local',
        'root' => 'F:\\laravelpractice\\itymeBackend-master_final\\public\\storage',
        'url' => 'https://admin.ityme.in/storage',
        'visibility' => 'public',
      ),
      's3' => 
      array (
        'driver' => 's3',
        'key' => NULL,
        'secret' => NULL,
        'region' => NULL,
        'bucket' => NULL,
      ),
    ),
  ),
  'firebase' => 
  array (
    'iss' => NULL,
  ),
  'http-logger' => 
  array (
    'log_profile' => 'Spatie\\HttpLogger\\LogNonGetRequests',
    'log_writer' => 'Spatie\\HttpLogger\\DefaultLogWriter',
    'except' => 
    array (
      0 => 'password',
      1 => 'password_confirmation',
    ),
  ),
  'ide-helper' => 
  array (
    'filename' => '_ide_helper',
    'meta_filename' => '.phpstorm.meta.php',
    'include_fluent' => false,
    'include_factory_builders' => false,
    'write_model_magic_where' => true,
    'write_model_external_builder_methods' => true,
    'write_model_relation_count_properties' => true,
    'write_eloquent_model_mixins' => false,
    'include_helpers' => false,
    'helper_files' => 
    array (
      0 => 'F:\\laravelpractice\\itymeBackend-master_final/vendor/laravel/framework/src/Illuminate/Support/helpers.php',
    ),
    'model_locations' => 
    array (
      0 => 'app',
    ),
    'ignored_models' => 
    array (
    ),
    'extra' => 
    array (
      'Eloquent' => 
      array (
        0 => 'Illuminate\\Database\\Eloquent\\Builder',
        1 => 'Illuminate\\Database\\Query\\Builder',
      ),
      'Session' => 
      array (
        0 => 'Illuminate\\Session\\Store',
      ),
    ),
    'magic' => 
    array (
    ),
    'interfaces' => 
    array (
    ),
    'custom_db_types' => 
    array (
    ),
    'model_camel_case_properties' => false,
    'type_overrides' => 
    array (
      'integer' => 'int',
      'boolean' => 'bool',
    ),
    'include_class_docblocks' => false,
    'force_fqn' => false,
    'additional_relation_types' => 
    array (
    ),
    'format' => 'php',
  ),
  'image' => 
  array (
    'driver' => 'gd',
  ),
  'laravel_google_translate' => 
  array (
    'google_translate_api_key' => NULL,
    'trans_functions' => 
    array (
      0 => 'trans',
      1 => 'trans_choice',
      2 => 'Lang::get',
      3 => 'Lang::choice',
      4 => 'Lang::trans',
      5 => 'Lang::transChoice',
      6 => '@lang',
      7 => '@choice',
      8 => '__',
      9 => '\\$trans.get',
      10 => '\\$t',
    ),
  ),
  'logging' => 
  array (
    'default' => 'daily',
    'channels' => 
    array (
      'stack' => 
      array (
        'driver' => 'stack',
        'channels' => 
        array (
          0 => 'daily',
        ),
        'ignore_exceptions' => false,
      ),
      'single' => 
      array (
        'driver' => 'single',
        'path' => 'F:\\laravelpractice\\itymeBackend-master_final\\storage\\logs/laravel.log',
        'level' => 'debug',
      ),
      'daily' => 
      array (
        'driver' => 'daily',
        'path' => 'F:\\laravelpractice\\itymeBackend-master_final\\storage\\logs/laravel-Admin.log',
        'level' => 'debug',
        'days' => 14,
        'permission' => 511,
      ),
      'slack' => 
      array (
        'driver' => 'slack',
        'url' => NULL,
        'username' => 'Laravel Log',
        'emoji' => ':boom:',
        'level' => 'critical',
      ),
      'papertrail' => 
      array (
        'driver' => 'monolog',
        'level' => 'debug',
        'handler' => 'Monolog\\Handler\\SyslogUdpHandler',
        'handler_with' => 
        array (
          'host' => NULL,
          'port' => NULL,
        ),
      ),
      'stderr' => 
      array (
        'driver' => 'monolog',
        'handler' => 'Monolog\\Handler\\StreamHandler',
        'formatter' => NULL,
        'with' => 
        array (
          'stream' => 'php://stderr',
        ),
      ),
      'syslog' => 
      array (
        'driver' => 'syslog',
        'level' => 'debug',
      ),
      'errorlog' => 
      array (
        'driver' => 'errorlog',
        'level' => 'debug',
      ),
    ),
  ),
  'mail' => 
  array (
    'driver' => 'mailgun',
    'host' => 'mailhog',
    'port' => '1025',
    'from' => 
    array (
      'address' => '',
      'name' => '',
    ),
    'encryption' => '',
    'username' => '',
    'password' => '',
    'sendmail' => '/usr/sbin/sendmail -bs',
    'markdown' => 
    array (
      'theme' => 'default',
      'paths' => 
      array (
        0 => 'F:\\laravelpractice\\itymeBackend-master_final\\resources\\views/vendor/mail',
      ),
    ),
  ),
  'medialibrary' => 
  array (
    'disk_name' => 'public',
    'max_file_size' => 10485760,
    'queue_name' => '',
    'media_model' => 'Spatie\\MediaLibrary\\Models\\Media',
    's3' => 
    array (
      'domain' => 'https://.s3.amazonaws.com',
    ),
    'remote' => 
    array (
      'extra_headers' => 
      array (
        'CacheControl' => 'max-age=604800',
      ),
    ),
    'responsive_images' => 
    array (
      'width_calculator' => 'Spatie\\MediaLibrary\\ResponsiveImages\\WidthCalculator\\FileSizeOptimizedWidthCalculator',
      'use_tiny_placeholders' => true,
      'tiny_placeholder_generator' => 'Spatie\\MediaLibrary\\ResponsiveImages\\TinyPlaceholderGenerator\\Blurred',
    ),
    'url_generator' => NULL,
    'version_urls' => false,
    'path_generator' => NULL,
    'image_optimizers' => 
    array (
      'Spatie\\ImageOptimizer\\Optimizers\\Jpegoptim' => 
      array (
        0 => '--strip-all',
        1 => '--all-progressive',
      ),
      'Spatie\\ImageOptimizer\\Optimizers\\Pngquant' => 
      array (
        0 => '--force',
      ),
      'Spatie\\ImageOptimizer\\Optimizers\\Optipng' => 
      array (
        0 => '-i0',
        1 => '-o2',
        2 => '-quiet',
      ),
      'Spatie\\ImageOptimizer\\Optimizers\\Svgo' => 
      array (
        0 => '--disable=cleanupIDs',
      ),
      'Spatie\\ImageOptimizer\\Optimizers\\Gifsicle' => 
      array (
        0 => '-b',
        1 => '-O3',
      ),
    ),
    'image_generators' => 
    array (
      0 => 'Spatie\\MediaLibrary\\ImageGenerators\\FileTypes\\Image',
      1 => 'Spatie\\MediaLibrary\\ImageGenerators\\FileTypes\\Webp',
      2 => 'Spatie\\MediaLibrary\\ImageGenerators\\FileTypes\\Pdf',
      3 => 'Spatie\\MediaLibrary\\ImageGenerators\\FileTypes\\Svg',
      4 => 'Spatie\\MediaLibrary\\ImageGenerators\\FileTypes\\Video',
    ),
    'image_driver' => 'gd',
    'ffmpeg_path' => '/usr/bin/ffmpeg',
    'ffprobe_path' => '/usr/bin/ffprobe',
    'temporary_directory_path' => NULL,
    'jobs' => 
    array (
      'perform_conversions' => 'Spatie\\MediaLibrary\\Jobs\\PerformConversions',
      'generate_responsive_images' => 'Spatie\\MediaLibrary\\Jobs\\GenerateResponsiveImages',
    ),
  ),
  'model-status' => 
  array (
    'status_model' => 'Spatie\\ModelStatus\\Status',
    'model_primary_key_attribute' => 'model_id',
  ),
  'onesignal' => 
  array (
    'app_id' => 'YOUR-APP-ID-HERE',
    'rest_api_key' => 'YOUR-REST-API-KEY-HERE',
    'user_auth_key' => 'YOUR-USER-AUTH-KEY',
    'guzzle_client_timeout' => 0,
  ),
  'passport' => 
  array (
    'private_key' => NULL,
    'public_key' => NULL,
    'client_uuids' => false,
  ),
  'payment' => 
  array (
    'models' => 
    array (
      'payment' => '',
    ),
  ),
  'permission' => 
  array (
    'models' => 
    array (
      'permission' => 'Spatie\\Permission\\Models\\Permission',
      'role' => 'Spatie\\Permission\\Models\\Role',
    ),
    'table_names' => 
    array (
      'roles' => 'roles',
      'permissions' => 'permissions',
      'model_has_permissions' => 'model_has_permissions',
      'model_has_roles' => 'model_has_roles',
      'role_has_permissions' => 'role_has_permissions',
    ),
    'column_names' => 
    array (
      'model_morph_key' => 'model_id',
    ),
    'display_permission_in_exception' => false,
    'display_role_in_exception' => false,
    'enable_wildcard_permission' => false,
    'cache' => 
    array (
      'expiration_time' => 
      DateInterval::__set_state(array(
         'y' => 0,
         'm' => 0,
         'd' => 0,
         'h' => 24,
         'i' => 0,
         's' => 0,
         'f' => 0.0,
         'weekday' => 0,
         'weekday_behavior' => 0,
         'first_last_day_of' => 0,
         'invert' => 0,
         'days' => false,
         'special_type' => 0,
         'special_amount' => 0,
         'have_weekday_relative' => 0,
         'have_special_relative' => 0,
      )),
      'key' => 'spatie.permission.cache',
      'model_key' => 'name',
      'store' => 'default',
    ),
  ),
  'plans' => 
  array (
    'models' => 
    array (
      'plan' => 'Rennokki\\Plans\\Models\\PlanModel',
      'subscription' => 'Rennokki\\Plans\\Models\\PlanSubscriptionModel',
      'feature' => 'Rennokki\\Plans\\Models\\PlanFeatureModel',
      'usage' => 'Rennokki\\Plans\\Models\\PlanSubscriptionUsageModel',
      'stripeCustomer' => 'Rennokki\\Plans\\Models\\StripeCustomerModel',
    ),
  ),
  'queue' => 
  array (
    'default' => 'database',
    'connections' => 
    array (
      'sync' => 
      array (
        'driver' => 'sync',
      ),
      'database' => 
      array (
        'driver' => 'database',
        'table' => 'jobs',
        'queue' => 'default',
        'retry_after' => 90,
      ),
      'beanstalkd' => 
      array (
        'driver' => 'beanstalkd',
        'host' => 'localhost',
        'queue' => 'default',
        'retry_after' => 90,
      ),
      'sqs' => 
      array (
        'driver' => 'sqs',
        'key' => 'your-public-key',
        'secret' => 'your-secret-key',
        'prefix' => 'https://sqs.us-east-1.amazonaws.com/your-account-id',
        'queue' => 'your-queue-name',
        'region' => 'us-east-1',
      ),
      'redis' => 
      array (
        'driver' => 'redis',
        'connection' => 'default',
        'queue' => 'default',
        'retry_after' => 90,
      ),
    ),
    'failed' => 
    array (
      'database' => 'mysql',
      'table' => 'failed_jobs',
    ),
  ),
  'rating' => 
  array (
    'models' => 
    array (
      'rating' => 'Rennokki\\Rating\\Models\\RaterModel',
    ),
  ),
  'services' => 
  array (
    'mailgun' => 
    array (
      'domain' => '',
      'secret' => '',
    ),
    'ses' => 
    array (
      'key' => '',
      'secret' => '',
      'region' => 'us-east-1',
    ),
    'sparkpost' => 
    array (
      'secret' => NULL,
    ),
    'stripe' => 
    array (
      'model' => NULL,
      'key' => '',
      'secret' => '',
    ),
    'bitbucket' => 
    array (
      'client_id' => NULL,
      'client_secret' => NULL,
      'redirect' => NULL,
      'scopes' => 
      array (
      ),
      'with' => 
      array (
      ),
    ),
    'facebook' => 
    array (
      'client_id' => NULL,
      'client_secret' => NULL,
      'redirect' => NULL,
      'scopes' => 
      array (
      ),
      'with' => 
      array (
      ),
      'fields' => 
      array (
      ),
    ),
    'github' => 
    array (
      'client_id' => NULL,
      'client_secret' => NULL,
      'redirect' => NULL,
      'scopes' => 
      array (
      ),
      'with' => 
      array (
      ),
    ),
    'google' => 
    array (
      'client_id' => '207933413299-cmckftj38id0f8urub5tcujtmkb6tr7h.apps.googleusercontent.com',
      'client_secret' => NULL,
      'redirect' => NULL,
      'scopes' => 
      array (
        0 => 'https://www.googleapis.com/auth/plus.me',
        1 => 'https://www.googleapis.com/auth/plus.profile.emails.read',
      ),
      'with' => 
      array (
      ),
    ),
    'linkedin' => 
    array (
      'client_id' => NULL,
      'client_secret' => NULL,
      'redirect' => NULL,
      'scopes' => 
      array (
      ),
      'with' => 
      array (
      ),
      'fields' => 
      array (
      ),
    ),
    'twitter' => 
    array (
      'client_id' => NULL,
      'client_secret' => NULL,
      'redirect' => NULL,
      'scopes' => 
      array (
      ),
      'with' => 
      array (
      ),
    ),
  ),
  'session' => 
  array (
    'driver' => 'file',
    'lifetime' => 120,
    'expire_on_close' => false,
    'encrypt' => false,
    'files' => 'F:\\laravelpractice\\itymeBackend-master_final\\storage\\framework/sessions',
    'connection' => NULL,
    'table' => 'sessions',
    'store' => NULL,
    'lottery' => 
    array (
      0 => 2,
      1 => 100,
    ),
    'cookie' => 'laravel_session',
    'path' => '/',
    'domain' => NULL,
    'secure' => false,
    'http_only' => true,
  ),
  'telescope' => 
  array (
    'domain' => NULL,
    'path' => 'telescope',
    'driver' => 'database',
    'storage' => 
    array (
      'database' => 
      array (
        'connection' => 'mysql',
        'chunk' => 1000,
      ),
    ),
    'enabled' => true,
    'middleware' => 
    array (
      0 => 'web',
      1 => 'Laravel\\Telescope\\Http\\Middleware\\Authorize',
    ),
    'ignore_paths' => 
    array (
      0 => 'nova-api*',
    ),
    'ignore_commands' => 
    array (
    ),
    'watchers' => 
    array (
      'Laravel\\Telescope\\Watchers\\CacheWatcher' => false,
      'Laravel\\Telescope\\Watchers\\CommandWatcher' => 
      array (
        'enabled' => false,
        'ignore' => 
        array (
        ),
      ),
      'Laravel\\Telescope\\Watchers\\DumpWatcher' => false,
      'Laravel\\Telescope\\Watchers\\EventWatcher' => 
      array (
        'enabled' => true,
        'ignore' => 
        array (
        ),
      ),
      'Laravel\\Telescope\\Watchers\\ExceptionWatcher' => true,
      'Laravel\\Telescope\\Watchers\\JobWatcher' => false,
      'Laravel\\Telescope\\Watchers\\LogWatcher' => true,
      'Laravel\\Telescope\\Watchers\\MailWatcher' => false,
      'Laravel\\Telescope\\Watchers\\ModelWatcher' => 
      array (
        'enabled' => false,
        'events' => 
        array (
          0 => 'eloquent.*',
        ),
      ),
      'Laravel\\Telescope\\Watchers\\NotificationWatcher' => false,
      'Laravel\\Telescope\\Watchers\\QueryWatcher' => 
      array (
        'enabled' => true,
        'ignore_packages' => true,
        'slow' => 100,
      ),
      'Laravel\\Telescope\\Watchers\\RedisWatcher' => false,
      'Laravel\\Telescope\\Watchers\\RequestWatcher' => 
      array (
        'enabled' => true,
        'size_limit' => 64,
      ),
      'Laravel\\Telescope\\Watchers\\GateWatcher' => 
      array (
        'enabled' => false,
        'ignore_abilities' => 
        array (
        ),
        'ignore_packages' => true,
      ),
      'Laravel\\Telescope\\Watchers\\ScheduleWatcher' => false,
      'Laravel\\Telescope\\Watchers\\ViewWatcher' => false,
    ),
  ),
  'tinker' => 
  array (
    'commands' => 
    array (
    ),
    'alias' => 
    array (
    ),
    'dont_alias' => 
    array (
      0 => 'App\\Nova',
    ),
  ),
  'translatable' => 
  array (
    'fallback_locale' => 'en',
  ),
  'translation-manager' => 
  array (
    'route' => 
    array (
      'prefix' => 'translations',
      'middleware' => 'auth',
    ),
    'delete_enabled' => true,
    'exclude_groups' => 
    array (
    ),
    'exclude_langs' => 
    array (
    ),
    'sort_keys ' => false,
    'trans_functions' => 
    array (
      0 => 'trans',
      1 => 'trans_choice',
      2 => 'Lang::get',
      3 => 'Lang::choice',
      4 => 'Lang::trans',
      5 => 'Lang::transChoice',
      6 => '@lang',
      7 => '@choice',
      8 => '__',
      9 => '$trans.get',
    ),
  ),
  'view' => 
  array (
    'paths' => 
    array (
      0 => 'F:\\laravelpractice\\itymeBackend-master_final\\resources\\views',
    ),
    'compiled' => 'F:\\laravelpractice\\itymeBackend-master_final\\storage\\framework\\views',
  ),
  'vtlabs_appointment' => 
  array (
    'models' => 
    array (
      'appointment' => 'Vtlabs\\Appointment\\Models\\Appointment',
    ),
    'appointment' => 
    array (
      'status_list' => 
      array (
        0 => 'pending',
        1 => 'accepted',
        2 => 'onway',
        3 => 'ongoing',
        4 => 'complete',
        5 => 'cancelled',
        6 => 'rejected',
      ),
      'status_default' => 'pending',
    ),
  ),
  'vtlabs_category' => 
  array (
    'models' => 
    array (
      'category' => 'Vtlabs\\Category\\Models\\Category',
    ),
    'resources' => 
    array (
      'admin' => 
      array (
        'category' => 'Vtlabs\\Category\\Http\\Resources\\Admin\\CategoryResource',
      ),
      'category' => 'Vtlabs\\Category\\Http\\Resources\\CategoryResource',
    ),
    'tables' => 
    array (
      'category' => 'categories',
    ),
    'images' => 
    array (
      'thumb' => 50,
    ),
  ),
  'vtlabs_core' => 
  array (
    'constants' => 
    array (
    ),
    'images' => 
    array (
      'thumb' => 50,
      'small' => 150,
    ),
  ),
  'vtlabs_doctor' => 
  array (
    'doctor' => 
    array (
      'verify_default' => true,
    ),
  ),
  'vtlabs_ecommerce' => 
  array (
    'models' => 
    array (
      'addon_choice' => 'Vtlabs\\Ecommerce\\Models\\AddonChoice',
      'addon_group' => 'Vtlabs\\Ecommerce\\Models\\AddonGroup',
      'address' => 'Vtlabs\\Ecommerce\\Models\\Address',
      'order' => 'Vtlabs\\Ecommerce\\Models\\Order',
      'order_delivery' => 'Vtlabs\\Ecommerce\\Models\\OrderDelivery',
      'order_product' => 'Vtlabs\\Ecommerce\\Models\\OrderProduct',
      'order_product_addon' => 'Vtlabs\\Ecommerce\\Models\\OrderProductAddon',
      'product' => 'Vtlabs\\Ecommerce\\Models\\Product',
      'user' => 'Vtlabs\\Core\\Models\\User\\User',
      'vendor' => 'Vtlabs\\Ecommerce\\Models\\Vendor',
      'vendor_product' => 'Vtlabs\\Ecommerce\\Models\\VendorProduct',
      'delivery_profile' => 'Vtlabs\\Ecommerce\\Models\\DeliveryProfile',
      'coupon' => 'Vtlabs\\Ecommerce\\Models\\Coupon',
      'coupon_user' => 'Vtlabs\\Ecommerce\\Models\\Coupon',
    ),
    'resources' => 
    array (
      'admin' => 
      array (
        'vendor' => 'Vtlabs\\Ecommerce\\Http\\Resources\\Admin\\VendorResource',
        'product' => 'Vtlabs\\Ecommerce\\Http\\Resources\\Admin\\ProductResource',
        'vendor_product' => 'Vtlabs\\Ecommerce\\Http\\Resources\\Admin\\VendorProductResource',
        'addon_group' => 'Vtlabs\\Ecommerce\\Http\\Resources\\Admin\\AddonGroupResource',
        'addon_choice' => 'Vtlabs\\Ecommerce\\Http\\Resources\\Admin\\AddonChoiceResource',
      ),
      'vendor' => 'Vtlabs\\Ecommerce\\Http\\Resources\\VendorResource',
      'product' => 'Vtlabs\\Ecommerce\\Http\\Resources\\ProductResource',
      'vendor_product' => 'Vtlabs\\Ecommerce\\Http\\Resources\\VendorProductResource',
    ),
    'vendor' => 
    array (
      'status_list' => 
      array (
        0 => 'open',
        1 => 'close',
      ),
      'status_default' => 'open',
      'verify_default' => true,
    ),
    'order' => 
    array (
      'status_list' => 
      array (
        0 => 'new',
        1 => 'pending',
        2 => 'cancelled',
        3 => 'rejected',
        4 => 'refund',
        5 => 'hold',
        6 => 'failed',
        7 => 'accepted',
        8 => 'preparing',
        9 => 'prepared',
        10 => 'dispatched',
        11 => 'intransit',
        12 => 'complete',
      ),
      'status_default' => 'new',
      'verify_default' => true,
    ),
    'delivery_profile' => 
    array (
      'verify_default' => true,
    ),
    'order_delivery' => 
    array (
      'status_list' => 
      array (
        0 => 'new',
        1 => 'pending',
        2 => 'allotted',
        3 => 'pickup',
        4 => 'started',
        5 => 'cancelled',
        6 => 'complete',
      ),
      'status_default' => 'new',
    ),
    'delivery_order_request' => 
    array (
      'status_list' => 
      array (
        0 => 'pending',
        1 => 'accepted',
        2 => 'rejected',
      ),
      'status_default' => 'pending',
    ),
    'product' => 
    array (
      'status_list' => 
      array (
        0 => 'pending',
        1 => 'rejected',
        2 => 'approved',
      ),
      'status_default' => 'approved',
    ),
  ),
  'vtlabs_faq' => 
  array (
    'tables' => 
    array (
      'faq' => 'faqs',
    ),
    'images' => 
    array (
    ),
  ),
  'vtlabs_payment' => 
  array (
    'models' => 
    array (
      'payment' => 'Vtlabs\\Payment\\Models\\Payment',
    ),
    'payment' => 
    array (
      'status_list' => 
      array (
        0 => 'pending',
        1 => 'paid',
        2 => 'failed',
        3 => 'postpaid',
      ),
      'status_default' => 'pending',
    ),
  ),
  'vtlabs_support' => 
  array (
    'tables' => 
    array (
      'support' => 'supports',
    ),
    'images' => 
    array (
    ),
  ),
  'wallet' => 
  array (
    'user_model' => 'Vtlabs\\Core\\Models\\User\\User',
    'wallet_model' => 'Depsimon\\Wallet\\Wallet',
    'transaction_model' => 'Depsimon\\Wallet\\Transaction',
  ),
  'comments' => 
  array (
    'comment_class' => 'BeyondCode\\Comments\\Comment',
    'user_model' => NULL,
  ),
  'excel' => 
  array (
    'exports' => 
    array (
      'chunk_size' => 1000,
      'pre_calculate_formulas' => false,
      'csv' => 
      array (
        'delimiter' => ',',
        'enclosure' => '"',
        'line_ending' => '
',
        'use_bom' => false,
        'include_separator_line' => false,
        'excel_compatibility' => false,
      ),
    ),
    'imports' => 
    array (
      'read_only' => true,
      'heading_row' => 
      array (
        'formatter' => 'slug',
      ),
      'csv' => 
      array (
        'delimiter' => ',',
        'enclosure' => '"',
        'escape_character' => '\\',
        'contiguous' => false,
        'input_encoding' => 'UTF-8',
      ),
    ),
    'extension_detector' => 
    array (
      'xlsx' => 'Xlsx',
      'xlsm' => 'Xlsx',
      'xltx' => 'Xlsx',
      'xltm' => 'Xlsx',
      'xls' => 'Xls',
      'xlt' => 'Xls',
      'ods' => 'Ods',
      'ots' => 'Ods',
      'slk' => 'Slk',
      'xml' => 'Xml',
      'gnumeric' => 'Gnumeric',
      'htm' => 'Html',
      'html' => 'Html',
      'csv' => 'Csv',
      'tsv' => 'Csv',
      'pdf' => 'Dompdf',
    ),
    'value_binder' => 
    array (
      'default' => 'Maatwebsite\\Excel\\DefaultValueBinder',
    ),
    'transactions' => 
    array (
      'handler' => 'db',
    ),
    'temporary_files' => 
    array (
      'local_path' => 'C:\\Users\\Admin\\AppData\\Local\\Temp',
      'remote_disk' => NULL,
      'remote_prefix' => NULL,
    ),
  ),
  'like' => 
  array (
    'user_foreign_key' => 'user_id',
    'likes_table' => 'likes',
    'like_model' => 'Overtrue\\LaravelLike\\Like',
  ),
  'apidoc' => 
  array (
    'type' => 'static',
    'output_folder' => 'public/docs',
    'laravel' => 
    array (
      'autoload' => false,
      'docs_url' => '/doc',
      'middleware' => 
      array (
      ),
    ),
    'router' => 'laravel',
    'storage' => 'local',
    'base_url' => NULL,
    'postman' => 
    array (
      'enabled' => true,
      'name' => NULL,
      'description' => NULL,
      'auth' => NULL,
    ),
    'routes' => 
    array (
      0 => 
      array (
        'match' => 
        array (
          'domains' => 
          array (
            0 => '*',
          ),
          'prefixes' => 
          array (
            0 => '*',
          ),
          'versions' => 
          array (
            0 => 'v1',
          ),
        ),
        'include' => 
        array (
        ),
        'exclude' => 
        array (
        ),
        'apply' => 
        array (
          'headers' => 
          array (
            'Content-Type' => 'application/json',
            'Accept' => 'application/json',
          ),
          'response_calls' => 
          array (
            'methods' => 
            array (
              0 => 'GET',
            ),
            'config' => 
            array (
              'app.env' => 'documentation',
              'app.debug' => false,
            ),
            'cookies' => 
            array (
            ),
            'queryParams' => 
            array (
            ),
            'bodyParams' => 
            array (
            ),
          ),
        ),
      ),
    ),
    'strategies' => 
    array (
      'metadata' => 
      array (
        0 => 'Mpociot\\ApiDoc\\Extracting\\Strategies\\Metadata\\GetFromDocBlocks',
      ),
      'urlParameters' => 
      array (
        0 => 'Mpociot\\ApiDoc\\Extracting\\Strategies\\UrlParameters\\GetFromUrlParamTag',
      ),
      'queryParameters' => 
      array (
        0 => 'Mpociot\\ApiDoc\\Extracting\\Strategies\\QueryParameters\\GetFromQueryParamTag',
      ),
      'headers' => 
      array (
        0 => 'Mpociot\\ApiDoc\\Extracting\\Strategies\\RequestHeaders\\GetFromRouteRules',
      ),
      'bodyParameters' => 
      array (
        0 => 'Mpociot\\ApiDoc\\Extracting\\Strategies\\BodyParameters\\GetFromBodyParamTag',
      ),
      'responses' => 
      array (
        0 => 'Mpociot\\ApiDoc\\Extracting\\Strategies\\Responses\\UseTransformerTags',
        1 => 'Mpociot\\ApiDoc\\Extracting\\Strategies\\Responses\\UseResponseTag',
        2 => 'Mpociot\\ApiDoc\\Extracting\\Strategies\\Responses\\UseResponseFileTag',
        3 => 'Mpociot\\ApiDoc\\Extracting\\Strategies\\Responses\\UseApiResourceTags',
        4 => 'Mpociot\\ApiDoc\\Extracting\\Strategies\\Responses\\ResponseCalls',
      ),
    ),
    'logo' => false,
    'default_group' => 'general',
    'example_languages' => 
    array (
      0 => 'bash',
      1 => 'javascript',
    ),
    'fractal' => 
    array (
      'serializer' => NULL,
    ),
    'faker_seed' => NULL,
    'routeMatcher' => 'Mpociot\\ApiDoc\\Matching\\RouteMatcher',
  ),
);
