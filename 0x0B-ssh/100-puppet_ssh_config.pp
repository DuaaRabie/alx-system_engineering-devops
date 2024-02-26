#Client configuration file (w/ Puppet)

class { 'ssh::client':
  storeconfigs_enabled => false,
  options    => {
    'Host short' => {
      'User'     => 'ubuntu',
      'HostName' => '54.86.244.25',
    },
    'Host *' => {
      'User'               => 'ubuntu',
      'UserKnownHostsFile' => '~/.ssh/school',
    },
  },
}
