# == Class: unicorn_systemd
#
# This class install and configure systemd unit files for unicorn
#
define unicorn_systemd (
  String $user,
  String $group,
  String $working_directory,
  String $pidfile,
  Hash[String, String] $environment,
  String $exec_start,
  String $ensure = present,
  String $service_ensure = running,
  Boolean $service_enable = true,
  String $service_name = 'unicorn'
) {

  file { "/etc/systemd/system/${service_name}.service":
    ensure  => $ensure,
    content => template('unicorn_systemd/unicorn.service.erb'),
    owner   => 'root',
    group   => 'root',
  }

  service { $service_name:
    ensure  => $service_ensure,
    enable  => $service_enable,
    require => File["/etc/systemd/system/${service_name}.service"],
  }

}
