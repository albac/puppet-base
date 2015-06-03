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
      $ssh_service  = 'ssh'
    }
    'RedHat': {
      $package_name = ['redhat-lsb','mailx','mlocate','nfs-utils','vim-common','vim-enhanced']
      $ssh_service  = 'sshd'
    }
    'Linux': {
      $package_name = ['redhat-lsb','mailx','mlocate','nfs-utils','vim-common','vim-enhanced']
      $ssh_service  = 'sshd'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
