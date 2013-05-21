class website {
    include nginx
    include nginx::fpm
    include web_php_apc
    include sysctl_web
    include wordpress

}
