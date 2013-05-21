class nagios::target {
      @@nagios_host { $::fqdn:
         alias => $hostname,
         address => $::ipaddress,
         use => 'linux-server',
         target        => "/etc/nagios/conf.d/host_${::fqdn}.cfg"
      }

      @@nagios_hostextinfo { $fqdn:
         ensure => present,
         icon_image_alt => $operatingsystem,
         icon_image => "base/$operatingsystem.png",
         statusmap_image => "base/$operatingsystem.gd2",
      }

      @@nagios_service { "check_ping_${hostname}":
         use => "check_ping_template",
         host_name => "$fqdn",
         target        => "/etc/nagios/conf.d/check_ping_${::fqdn}.cfg"
      }

      @@nagios_service { "check_users_${hostname}":
         use => "remote-nrpe-users",
         host_name => "$fqdn",
      }

      @@nagios_service { "check_load_${hostname}":
         use => "remote-nrpe-load",
         host_name => "$fqdn",
      }

      @@nagios_service { "check_zombie_procs_${hostname}":
         use => "remote-nrpe-zombie-procs",
         host_name => "$fqdn",
      }

      @@nagios_service { "check_total_procs_${hostname}":
         use => "remote-nrpe-total-procs",
         host_name => "$fqdn",
      }

      @@nagios_service { "check_swap_${hostname}":
         use => "remote-nrpe-swap",
         host_name => "$fqdn",
      }

      @@nagios_service { "check_all_disks_${hostname}":
         use => "remote-nrpe-all-disks",
         host_name => "$fqdn",
      }
   }
