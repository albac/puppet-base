# == Class base::params
#
# This class is meant to be called from base.
# It sets variables according to platform.
#
class base::params {

  $general_packages = ['telnet','screen','htop']

  case $::osfamily {
    'Debian': {
      $package_name = ['mailutils','locate','vim']
    }
    'RedHat': {
      $package_name = ['redhat-lsb']
    }
    'Linux': {
      $package_name = ['redhat-lsb','mailx','mlocate','nfs-utils','vim-common','vim-enhanced']
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
