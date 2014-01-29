# Checks Riemann dashboard service status
class riemann::dash::service {
  service {'riemann-dash':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    provider   => $riemann::params::service_provider,
  }
}
