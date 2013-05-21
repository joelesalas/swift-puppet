class nginx::admin {

        file { "nginx_fpm_admin.conf":
                notify => Service["nginx"],
                name => "/usr/local/nginx/conf/nginx.conf",
                mode => 644,
                owner => "root",
                group => "root",
                backup => false,
                links => follow,
                source => "puppet:///modules/nginx/nginx_admin.conf"
        }

}
