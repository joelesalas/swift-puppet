class nginx::fpm {
        file { "nginx.conf":
                notify => Service["nginx"],
                name => "/etc/nginx/nginx.conf",
                mode => 644,
                owner => "root",
                group => "root",
                backup => false,
                links => follow,
                source => "puppet:///modules/nginx/nginx_fpm.conf"
        }

#        file { "fastcgi_params":
#                notify => Service["nginx"],
#                name => "/etc/nginx/conf/fastcgi_params",
#                mode => 644,
#                owner => "root",
#                group => "root",
#                backup => false,
#                links => follow,
#                source => "puppet:///modules/nginx/fastcgi_params"
#        }

}
