#Client configuration file (w/ Puppet)

::ssh::client::config::user { 'ubuntu':
  ensure   => present,
  options  => {
    'IdentityFile'           => '~/.ssh/school',
    'PasswordAuthentication' => 'no',
  }
}
