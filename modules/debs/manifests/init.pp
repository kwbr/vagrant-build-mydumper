class debs {
  $packages=[
    'build-essential',
    'cmake',
    'libglib2.0-dev',
    'libmysqlclient-dev',
    'zlib1g-dev',
    'libpcre3-dev',
    'screen'
  ]

  package {
    $packages:
      ensure  => installed,
      require => Exec['update repo'],
  }

  exec {
    'update repo':
      command => '/usr/bin/apt-get update',
  }
}
