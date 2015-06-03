# == Class base::params
#
# This class is meant to be called from base.
# It sets variables according to platform.
#
class base::params {

  $general_packages = ['telnet','screen','htop','vim']

  case $::osfamily {
    'Debian': {
      $package_name = ['mailutils','locate']
    }
    'RedHat': {
      $package_name = ['redhat-lsb']
    }
    'Linux': {
      $package_name = ['redhat-lsb','mailx','mlocate','nfs-utils']
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
