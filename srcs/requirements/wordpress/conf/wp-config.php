<?php
define( 'DB_NAME', getenv("WP_DB_NAME") );
define( 'DB_USER', getenv("MARIADB_USER") );
define( 'DB_PASSWORD', getenv("MARIADB_PWD") );
define( 'DB_HOST', getenv("DB_HOST") );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

define('WP_HOME','https://dong-kim.42.fr');
define('WP_SITEURL','https://dong-kim.42.fr');

define('AUTH_KEY',         'put your unique phrase here');
define('SECURE_AUTH_KEY',  'put your unique phrase here');
define('LOGGED_IN_KEY',    'put your unique phrase here');
define('NONCE_KEY',        'put your unique phrase here');
define('AUTH_SALT',        'put your unique phrase here');
define('SECURE_AUTH_SALT', 'put your unique phrase here');
define('LOGGED_IN_SALT',   'put your unique phrase here');
define('NONCE_SALT',       'put your unique phrase here');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';