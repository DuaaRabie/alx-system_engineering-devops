#Client configuration file (w/ Puppet)

file { '~/.ssh/config':
  ensure  => file,
  owner   => 'ubuntu',
  group   => 'ubuntu',
  mode    => '0600',
  content => template('ssh/client_config.erb'),
}
