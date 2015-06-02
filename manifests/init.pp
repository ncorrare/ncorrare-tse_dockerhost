# == Class: tse_dockerhost
#
# A demo module to set up a docker container with the "Ghost" Blogging Platform
#
# === Parameters
#
# [*interface*]
#   When the docker service is started for the first time in our demo environment, it unconfigures the secondary interface for some reason. As a quick workaround, please specify the interface here to run an ifup on it when the Catalog compilation is over.
#
# === Examples
#
#  class { 'tse_dockerhost':
#    interface => 'enp0s8',
#  }
#
# === Authors
#
# Nicolas Corrarello <nicolas@corrarello.com>
#
# === Copyright
#
# Copyright 2015 Nicolas Corrarello, unless otherwise noted.
#
class tse_dockerhost (
  $interface = undef,
)
  {
 class { 'docker':
  }
  docker::image { 'ghost':
    require => Class['docker'],
  }
  if $interface {
    docker::run { 'ghostblog':
      image   => 'ghost',
      command => 'npm start',
      require => Docker::Image['ghost'],
      ports   => ['80:2368','2368:2368'],
      notify  => Exec['ifup'],
    }
  }
    else
    {
      docker::run { 'ghostblog':
        image   => 'ghost',
        command => 'npm start',
        require => Docker::Image['ghost'],
        ports   => ['80:2368','2368:2368'],
      }
    }
    firewall { '100 allow http and https access':
    port   => [80, 2368],
    proto  => tcp,
    action => accept,
  }
  exec { 'ifup':
    command     => "/sbin/ifup $::interface",
    refreshonly => true,
  }
}
