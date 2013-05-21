class nagios {

   package {
      'nagios':
         ensure  => installed,
   }

   package { "nagios-plugins-all": ensure => "installed" }

   service {
      'nagios':
         ensure  => running,
         hasstatus       => true,
         hasrestart      => true,
         require => Package[nagios],
   }

   file { "/etc/nagios/conf.d":
      ensure => directory,
      owner => nagios,
      group => nagios,
      recurse => true,
    }


   service {
      'httpd':
         ensure => running,
         require => Package[nagios],
   }

@@nagios_service { "check_http_${hostname}":
      use => "check-http",
      host_name => "$fqdn",
   }

@@nagios_hostgroup { 'all-servers':
    alias => "Application Servers",
    target        => "/etc/nagios/conf.d/host_group.cfg"
} 

@@nagios_service { 'check_ping_template':
    alias         => "Check ping template",
    check_command => "check_ping",
    register      => '0',
    use => "generic-service",
    target        => "/etc/nagios/conf.d/check_ping_template.cfg"
}


file { "/etc/nagios/passwd":
      ensure => present,
      owner  => nagios,
      group  => nagios,
      mode   => 740,
      source => "puppet:///modules/nagios/passwd",
    }


   # collect resources and populate /etc/nagios/nagios_*.cfg
   Nagios_host <<||>> {
    notify => Service[nagios],
}
   Nagios_service <<||>> {
    notify => Service[nagios],
}
   Nagios_hostextinfo <<||>> {
    notify => Service[nagios],
}

Nagios_hostgroup <<| |>> { notify => Service['nagios'] }

}
