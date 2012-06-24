class build {
  exec {
    'get mydumper':
      command => '/usr/bin/wget -O /tmp/mydumper.tar.gz http://launchpad.net/mydumper/0.5/0.5.1/+download/mydumper-0.5.1.tar.gz',
      creates => '/tmp/mydumper.tar.gz'
  }
  file { 'mydumper install':
    ensure => directory,
    path   => '/opt/mydumper-install',
  }
  exec {
    'extract mydumper':
      command => '/bin/tar xvf /tmp/mydumper.tar.gz -C /opt',
      creates => '/opt/mydumper-0.5.1',
      require => Exec['get mydumper'],
  }
  file {
    '/usr/local/bin/build_mydumper.sh':
      source => 'puppet:///modules/build/build_mydumper.sh',
      mode   => '0755',
  }
  exec {
    'build mydumper':
      command => '/usr/bin/screen -d -m /usr/local/bin/build_mydumper.sh',
      cwd     => '/opt/mydumper-0.5.1',
      require => [File['/usr/local/bin/build_mydumper.sh'], Exec['extract mydumper']],

  }
  notify {
    'see mydumper':
      message  => 'To see mydumper compilation, log in as vagrant and run sudo screen -r',
      require  => Exec ['build mydumper'],
  }
}
