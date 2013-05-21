#import "nodes/*"
#import "modules/*"

node /^webserver\d+\.localdomain$/ 
{
    include nagios::target
    include base_system
    include website
    include wordpress
}

node "mysql.localdomain"
{
    include nagios::target
    include base_system
#    include mysql_server

class { 'mysql::server':
  config_hash => { 
     'root_password' => 'foo',
     'bind_address' => $::ipaddress,
     'default_engine' => 'innodb',
      },
}


    mysql::db { 'wordpress':
  user     => 'wpdude',
  password => 'swift2013',
  host     => '%',
  grant    => ['all'],
}
}

node "puppet"
{
    include nagios::target
    include base_system
#    include puppetdb
}


node "puppetdb.localdomain"
{
    include nagios::target
    include base_system
#    include puppetdb
}

node "nagios.localdomain"
{
    include nagios
    include nagios::target
    include base_system
}
