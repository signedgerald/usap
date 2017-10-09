 class time::motd {

    $timestamp = generate('/bin/date', '+%H:%M:%S')
    file { '/etc/motd':
    owner  => 'root',
    group  => 'root',
    mode    => '0644',
    content => "Agent run starting at $timestamp\n",
    }

 }
