# == Class base::config
#
# This class is called from base for service config.
#
class base::config {

  #This is needed because the way Amazon AMI is partioned by default

  file {'/opt/puppet_rundir':
    ensure => directory
  }

  file {'/var/run/puppet':
    ensure => link,
    force  => true,
    backup => false,
    target => '/opt/puppet_rundir',
    require => File['/opt/puppet_rundir']
  }

  file {'/etc/krb5.keytab':
    mode  => 0700,
    owner => root,
    group => root,
  }

  ini_setting {"rundir change":
    ensure  => present,
    path    => '/etc/puppet/puppet.conf',
    section => 'main',
    setting => 'rundir',
    value   => '/opt/puppet_rundir',
    require => File['/var/run/puppet']
  }

}
