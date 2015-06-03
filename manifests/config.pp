# == Class base::config
#
# This class is called from base for service config.
#
class base::config {

  #This is needed because the way Amazon AMI is partioned by default

  file {'/etc/krb5.keytab':
    mode  => 0700,
    owner => root,
    group => root,
  }

}
