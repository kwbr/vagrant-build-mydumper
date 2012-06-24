group { "puppet":
  ensure => "present",
}

File { owner => 0, group => 0, mode => 0644 }

file { '/etc/motd':
  content => "Welcome to your Vagrant-built virtual machine!
              Managed by Puppet.\n"
}

node default {
  class { 'debs':; }
  class { 'gems': require  => Class['debs']; }
  class { 'build': require => Class['gems']; }
}
