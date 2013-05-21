class wordpress {

    file { "/var/lib/puppet/clientbucket/wordpress.tar.gz":
        owner  => root,
        group  => root,
        mode   => 644,
        source => "puppet:///modules/wordpress/latest.tar.gz",
        notify  => Service["php-fpm"],
    }


#    file { "/var/www/html/wordpress":
#
#      ensure => directory,
#      owner => "nginx",
#      group => "nginx",
#}


    exec { "extract_wordpress":
      command   =>
      "/bin/tar -xz -f /var/lib/puppet/clientbucket/wordpress.tar.gz -C /var/www/html/",
      onlyif    => "/usr/bin/test ! -d /var/www/html/wordpress/",
      require   => File["/var/lib/puppet/clientbucket/wordpress.tar.gz"],
      logoutput => true,
    }

    file { "/var/www/html/wordpress/wp-config.php":
        owner  => root,
        group  => root,
        mode   => 644,
        source => "puppet:///modules/wordpress/wp-config.php",
        notify  => Service["php-fpm"],
        require => Exec["extract_wordpress"]
    }


}
