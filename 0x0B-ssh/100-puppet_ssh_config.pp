#Client configuration file (w/ Puppet)

class { 'ssh::client':
  storeconfigs_enabled => false,
  options    => {
    'Host short' => {
      'User'     => 'my-user',
      'HostName' => 'extreme.long.and.complicated.hostname.domain.tld',
    },
    'Host *' => {
      'User'               => 'andromeda',
      'UserKnownHostsFile' => '/dev/null',
    },
  },
}
