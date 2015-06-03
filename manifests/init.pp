# == Class: base
#
# Full description of class base here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class base (
  $package_name = $::base::params::package_name,
  $service_name = $::base::params::service_name,
  $ssh_service  = $::base::params::ssh_service,
) inherits ::base::params {

  validate_re($ssh_service,'^.+$')

  # validate parameters here

  class { '::base::packages': } ->
  class { '::base::config': } ->
  class { 'sudo': } ->
  class { 'timezone':
        timezone => 'UTC',
  } ->
  class { '::base::cis': } ->
  Class['::base']

  sudo::conf { 'sudo_admins':
    priority => 10,
    content  => "%sudoers ALL=(ALL) NOPASSWD: ALL",
  }

  sshd_config { "PasswordAuthentication":
    ensure => present,
    value  => "yes",
    notify => Service[ $ssh_service ]
  }

  service { $ssh_service : ensure => running }

}
