class web_php_apc {

$php = [	
	"php-pecl-apc",
	"php-pdo",
	"php-soap",
	"php-mbstring",
	"php-devel",
	"php-pecl-ncurses",
	"php-pecl-memcache",
	"php-cli",
	"php",
	"php-xmlrpc",
	"php-gd",
	"php-process",
	"php-mcrypt",
	"php-xml",
	"php-common",
	"php-mysql",
	"php-fpm",
	"php-intl",
]

        package { $php:
                ensure => installed,
                provider => yum,
                notify => Service["php-fpm"]
        }
		
    file { "/etc/php.d/apc.ini":
        owner  => root,        
        group  => root,  
        mode   => 644,
        source => "puppet:///modules/web_php_apc/apc.ini",
	notify  => Service["php-fpm"], 
    }       
        file { "php.ini":
                name => "/etc/php.ini",
                mode => 644,
                owner => "root",
                group => "root",
                source => "puppet:///modules/web_php_apc/php.ini",
                notify => Service["php-fpm"],
        }

        file { "fpm-www.conf":
                name => "/etc/php-fpm.d/www.conf",
                mode => 644,
                owner => "root",
                group => "root",
                backup => false,
                links => follow,
                source => "puppet:///modules/web_php_apc/www.conf",
                notify  => Service["php-fpm"],

        }

        service { "php-fpm":
                enable => true,
                ensure => running,
        }

}
