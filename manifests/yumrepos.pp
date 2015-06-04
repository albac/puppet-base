# == Define base::yumrepos
#
# This class is called from base for yumrepos.
#
define base::yumrepos {

  package { $::base::package_name:
    ensure => present,
  }

}
