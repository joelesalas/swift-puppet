class puppet {

   package {
      "puppet":
      require => Yumrepo["rpmforge"],
      ensure   => latest,
      notify => Service['puppet'],
      provider => yum,
   }

        service { "puppet":
                hasrestart => true,
                hasstatus => true,
                restart => "/etc/init.d/puppet restart",
        }

   file { "/etc/puppet/puppet.conf":
        owner  => root,
        group  => root,
        mode   => 644,
        source => "puppet:///modules/puppet/puppet.conf",
       notify  => Service["puppet"],
   }

}
