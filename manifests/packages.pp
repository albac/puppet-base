# == Class base::packages
#
# This class is called from base for packages.
#
class base::packages {

  package { $::base::general_packages:
    ensure => present,
  }
  package { $::base::package_name:
    ensure => present,
  }

}
