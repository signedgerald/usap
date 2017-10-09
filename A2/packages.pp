class packages {

    package { 'openssh': ensure => 'installed'}
    package { 'httpd': ensure => 'installed'}
    package { 'mysql': ensure => 'installed'}
    package { 'vnc': ensure => 'installed'}
    package { 'tmux': ensure => 'installed'}
    package { 'dia2code': ensure => 'installed'}
    /*package { 'lynx': ensure => 'installed'}*/
    package { 'gcc': ensure => 'installed'}
    package { 'gdb': ensure => 'installed'}
    /*package { 'cgdb': ensure => 'installed'}*/
    package { 'vim': ensure => 'installed'}
    package { 'emacs': ensure => 'installed'}
    /*package { 'sshfs': ensure => 'installed'}*/
    
}
