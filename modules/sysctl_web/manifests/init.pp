class sysctl_web {

file{'/etc/sysctl.conf':
        notify => Exec['/sbin/sysctl -p'],
        owner  => root,
        group  => root,
        mode   => 644,
        source => "puppet:///modules/sysctl_web/sysctl.conf_web"
}

exec {'/sbin/sysctl -p':
    path    => ['/usr/bin', '/bin', '/usr/sbin', '/sbin'],
    refreshonly => true,
}

}
