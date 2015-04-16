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
) inherits ::base::params {

  # validate parameters here

  class { '::base::packages': } ->
  class { '::base::config': } ->
  class { 'sudo': } ->
  sudo::conf { 'sudoers':
    priority => 10,
    content  => "%sudoers ALL=(ALL) NOPASSWD: ALL",
  } ->
  sudo::conf { 'ubuntu':
    priority => 10,
    content  => "ubuntu ALL=(ALL) NOPASSWD: ALL",
  } ->
  sshd_config { "PasswordAuthentication":
    ensure => present,
    value  => "yes",
    notify => Service['ssh']
  } ->
  service { 'ssh': ensure => running } ->
  class { 'timezone':
        timezone => 'America/Los_Angeles',
  } ->
  Class['::base']

}
