class sshd {
        file { "sshd_config": 
                name => "/etc/ssh/sshd_config",
                mode => 600,
                owner => "root",
                group => "root",
                backup => false,    
                links => follow,
                source => "puppet:///modules/sshd/sshd_config"
        }
        service { "sshd":     
                enable => true,                
                hasrestart => true,
                hasstatus => true,
                subscribe => File["sshd_config"],
                restart => "/etc/init.d/sshd restart",
                ensure => running,
        }
}
