# == Class base::install
#
# This class is called from base for install.
#
class base::install {

  package { $::base::general_packages:
    ensure => present,
  }
  package { $::base::package_name:
    ensure => present,
  }

}
