# == Class base::java
#
# This class is called from base for service java.
#
class base::java (
$ensure   = present,
$arch     = 'x64',
$apps_dir = '/opt/apps',
$version,
){

  $deployment_dir="${apps_dir}/${version}"
  $source="${version}-${arch}.tar.gz"

  file { $apps_dir :
    ensure => directory,
  }

  java::setup { "${version}-${arch}":
  ensure        => $ensure,
  source        => $source,
  deploymentdir => $deployment_dir,
  user          => 'root',
  require       => File [$apps_dir]
  }

}
