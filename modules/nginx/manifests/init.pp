class nginx {

        package { "nginx":
                ensure => installed,
        }

        file { "logrotate.nginx":
                name => "/etc/logrotate.d/nginx",
                mode => 644,
                owner => "root",
                group => "root",
                source => "puppet:///modules/nginx/nginx_logrotate"
        }

        service { "nginx":
                enable => true,
                hasstatus => true,
                hasrestart => true,
                restart => "/etc/init.d/nginx restart",
                ensure => running,
                require => Package["nginx"]
        }

}
