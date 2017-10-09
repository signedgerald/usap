class ssh {
  service { 'sshd':
    ensure => 'running',
    enable => true,
    require => Package['openssh-server'],
    }

  file { '/etc/ssh/sshd_config':
    notify => Service['sshd'],
    mode => '0600',
    owner => 'root',
    group => 'root',
    require => Package['openssh-server'],
    content => template('ssh/sshd_config.erb'),
    }
}
