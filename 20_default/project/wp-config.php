<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wpDB' );

/** Database username */
define( 'DB_USER', 'wpadmin' );

/** Database password */
define( 'DB_PASSWORD', '1234' );

/** Database hostname */
define( 'DB_HOST', 'database-wordpress.c1sqeewei6x5.ap-northeast-2.rds.amazonaws.com' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'X @`dAz:YCe{I?h8o#j1132>dE+ay/9n9k:1=&vDWrP+^{GM:X1G<)#(byfTVKGi' );
define( 'SECURE_AUTH_KEY',  'Ec)Pk2a7Q*lBNds0X/BG{/0u*DTMJF,K|Co)nuMV{~W$q$;w_o%X5%IIWlW!b{vr' );
define( 'LOGGED_IN_KEY',    'zS]C-3P|Jps_7[ar!CIJ_VfsDQR|]fx77vZ63Oj9:al0zP(-3T|+n~MM6JMVdJXP' );
define( 'NONCE_KEY',        'W[Dvsk%>jvtM78wJ!R9A*YubC&Xi$O4Ox<p90!r`uR7wg|>>k`w3c|^(7T4.1!,H' );
define( 'AUTH_SALT',        'v]Hh5*50SkL.6iS@PQ#sNa>9C7OUbLzUb|`6<Wr=08EcPY%m*`IfI:A4+z`C1J^5' );
define( 'SECURE_AUTH_SALT', 'FD+@n?F,<I%>z !,@oB6sW-,uo<()QJNF>Pt0||x LhUiOeR80LaE[JfU=0+?)1b' );
define( 'LOGGED_IN_SALT',   'b|}/ydaJNYPB%}dG4,,`uRW>ANWm$Uh1XBKR5#]s#D{gNH]~f._SX4?fOzr;&qFC' );
define( 'NONCE_SALT',       'cw(fa=zQYc?aW!#@R2iLt(mSckAEc^2p +gi7/~4[g<iQOIb>!WQOWilpjXZu|9v' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 *
 * At the installation time, database tables are created with the specified prefix.
 * Changing this value after WordPress is installed will make your site think
 * it has not been installed.
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/#table-prefix
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
