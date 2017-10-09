define fileserver_package($source, $ensure = 'installed') {
        file { "/home/ec2-user/s3560494-usap-a2/dia2code.rpm": source => $source }
        package { dia2code:
                ensure => $ensure,
                provider => 'rpm',
                source => "/home/ec2-user/s3560494-usap-a2/dia2code.rpm",
                require => File["/home/ec2-user/s3560494-usap-a2/dia2code.rpm"],
                }
}
