class riemann::install {
  include wget
 
  # TODO this should be refactored into a separate module
  package { [
      'leiningen',
      'clojure1.3',
    ]:
      ensure => installed,
  }

  wget::fetch { 'download_riemann':
    source      => "http://aphyr.com/riemann/riemann-${riemann::version}.tar.bz2",
    destination => "/usr/local/src/riemann-${riemann::version}.tar.bz2",
    before      => Exec['untar_riemann'],
  }

  file { '/opt/riemann':
    ensure => link,
    target => "/opt/riemann-${riemann::version}",
  }

  exec { 'untar_riemann':
    command => "tar xvfj /usr/local/src/riemann-${riemann::version}.tar.bz2",
    cwd     => '/opt',
    creates => "/opt/riemann-${riemann::version}",
    path    => ['/bin',],
    before  => File['/opt/riemann'],
  }

}
