class usaptest {
        user { 'becca':
        ensure => present,
        groups => ['sysadmin','cars'],
        uid => '10010494',
        shell => '/bin/bash',
        }

        user { 'fred':
        ensure => present,
        groups => ['trucks', 'cars'],
        uid => '10020494',
        shell => '/bin/csh',
        }

        user { 'wilma':
        ensure => present,
        groups => ['trucks', 'cars', 'ambulances'],
        uid => '10030494',
        }

        group { 'sysadmin':
        ensure => present,
        }

        group { 'cars':
        ensure => present,
        }

        group { 'trucks':
        ensure => present,
        }

        group { 'ambulances':
        ensure => present,
        }
}
