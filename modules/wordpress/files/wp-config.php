<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, WordPress Language, and ABSPATH. You can find more information
 * by visiting {@link http://codex.wordpress.org/Editing_wp-config.php Editing
 * wp-config.php} Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wordpress');

/** MySQL database username */
define('DB_USER', 'wpdude');

/** MySQL database password */
define('DB_PASSWORD', 'swift2013');

/** MySQL hostname */
define('DB_HOST', '10.211.55.6');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'S#QNn&LdhxnCvNj?]-|#d/NA_#k.9b`a#MB8,!!;w0ez(P]d7k)JAu{@?k7TaycP');
define('SECURE_AUTH_KEY',  'I%+oLBYQ; mY`o1OniQ;|q+3n+O$-arT-UI`zq+5t>!3`:qfMil_q~X-;e+oTZMO');
define('LOGGED_IN_KEY',    'Lr#:{Wf<c9VbeoTmW@eZqE(|1:w,OX,K(1{cqmfkFtof1/fR:1Q+`c/{SsTd62nZ');
define('NONCE_KEY',        '$8 KyO?66yP0[4w!0S3SRX-!fn[#L;v|p$Y-72[Pfj`Vz|ZoxW)Aej]TF1PLL^-T');
define('AUTH_SALT',        'lL?P8MW87KxywmGV%iDyV(+/E|()pxSt]TuA?C|E/T@x/T=6=#OI/h^pD8>+b9!L');
define('SECURE_AUTH_SALT', 'U$][^oK:<-]gE8u=T^%v#;b,=l}*G7eZ-_k<TB$2!k_rJUt7wL/MK~|3#Tlo[(^_');
define('LOGGED_IN_SALT',   '[|f{tX3db||;MK`(bAs)&>5`V}~w[W1Gw_{l5q8,;r+jRE2xkBMI%Y%H7!]Mf E+');
define('NONCE_SALT',       '#O%jxI$~;B?34>,|a;+-<i>-:eYCSNhq((Jq~}-c=8 OJ@oL$-*}{~8&C_U~|Eyl');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');


