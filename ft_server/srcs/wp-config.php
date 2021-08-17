<?php
/**
 ** Custom WordPress configurations on "wp-config.php" file.
 */

/* MySQL settings */
define( 'DB_NAME',     'wordpress' );
define( 'DB_USER',     'admin' );
define( 'DB_PASSWORD', 'admin' );
define( 'DB_HOST',     'localhost' );
define( 'DB_CHARSET',  'utf8' );

/* MySQL database table prefix. */
$table_prefix = 'wp_rchelsea';

/* Authentication Unique Keys and Salts. */
/* https://api.wordpress.org/secret-key/1.1/salt/ */
define( 'AUTH_KEY',         'put your unique phrase here' );
define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
define( 'NONCE_KEY',        'put your unique phrase here' );
define( 'AUTH_SALT',        'put your unique phrase here' );
define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
define( 'NONCE_SALT',       'put your unique phrase here' );

/* Absolute path to the WordPress directory. */
define( 'WP_DEBUG', false );
if ( ! defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/* Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
?>