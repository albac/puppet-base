# == Class base::params
#
# This class is meant to be called from base.
# It sets variables according to platform.
#
class base::params {

  $general_packages = ['screen','htop']

  case $::osfamily {
    'Debian': {
      $package_name = ['mailutils','locate','vim']
      $ssh_service  = 'ssh'
      $iptables_service = 'iptables'
    }
    'RedHat': {
      $package_name = ['redhat-lsb','mailx','mlocate','nfs-utils','vim-common','vim-enhanced']
      $ssh_service  = 'sshd'
      $iptables_service = 'iptables'
    }
    'Linux': {
      $package_name = ['redhat-lsb','mailx','mlocate','nfs-utils','vim-common','vim-enhanced']
      $ssh_service  = 'sshd'
      $iptables_service = 'iptables'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
