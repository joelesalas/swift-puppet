class puppet::migrate ( $puppetmaster ) {

  augeas {'puppet.conf.migrate':
    context => '/files/etc/puppet/puppet.conf/main',
    changes => ["set server ${puppet::migrate::puppetmaster}",
        ]
  }

  # These next two objects handle migration to a new puppet master
  # server - if the value of $puppetmaster is updated, the
  # puppet-clear-certs.sh script is executed.
  file {'/var/lib/puppet/lib/puppet-clear-certs.sh':
    owner  => 'root',
    group  => 'root',
    mode   => 700,
    source => 'puppet:///dist/puppet/puppet-clear-certs.sh',
  }

  exec {'/var/lib/puppet/lib/puppet-clear-certs.sh':
    path    => ['/usr/bin', '/bin', '/usr/sbin', '/sbin'],
    require => [File ['/var/lib/puppet/lib/puppet-clear-certs.sh'],
                Augeas ['puppet.conf.migrate'],
                ],
    unless  => ["openssl x509 -text -in /var/lib/puppet/ssl/certs/ca.pem | grep ${puppet::migrate::puppetmaster} >/dev/null 2>&1",
                "openssl x509 -text -in /var/lib/puppet/ssl/certs/${fqdn}.pem | grep ${puppet::migrate::puppetmaster} >/dev/null 2>&1",
                ]
  }
}
