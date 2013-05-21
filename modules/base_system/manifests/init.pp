class base_system {
    include default_packages
    include users::admins
    include puppet
    include yum
    include sshd
    include iptables
}
