file { '/etc/security/limits.d/holberton-limits.conf':
  ensure  => present,
  content => "
# Increase resource limits for holberton user
holberton soft nofile 65535
holberton hard nofile 65535
",
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
}

exec { 'apply-limits':
  command     => '/bin/true',
  refreshonly => true,
  subscribe   => File['/etc/security/limits.d/holberton-limits.conf'],
}
