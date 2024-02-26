#Client configuration file (w/ Puppet)

class { 'ssh::client':
  private_key_path        => '/home/username/.ssh/school',
  password_authentication => false,
}
