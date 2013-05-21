class yum {
    package {
      "epel-release":
      ensure => 'installed',
      source => "http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm" 
    }

    yumrepo {
      "epel":
      descr => "Extra Packages for Enterprise Linux 6",
      mirrorlist => "https://mirrors.fedoraproject.org/metalink?repo=epel-6&arch=x86_64",
      gpgcheck => "0",
      gpgkey  => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-6",
      enabled => "1"
    }


    yumrepo {
      "rpmforge":
      descr      => "Red Hat Enterprise $releasever - RPMforge.net - dag",
      mirrorlist => "http://apt.sw.be/redhat/el5/en/mirrors-rpmforge",
      gpgcheck   => "0",
      gpgkey     => "file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag",
      enabled    => "1",
#      priority   => "15"
     } ### End yumrepo::

}
