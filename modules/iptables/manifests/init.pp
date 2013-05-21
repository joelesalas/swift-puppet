class iptables {
 
service { "iptables":
                enable => false,
                hasstatus => true,
                hasrestart => true,
                restart => "/etc/init.d/nginx restart",
                ensure => stopped,
        }


}
