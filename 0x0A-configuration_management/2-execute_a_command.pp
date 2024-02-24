#create a manifest that kills a process named killmenow

service { 'killmenow':
  ensure   => 'stopped',
  provider => 'systemd', # or 'init', depending on your system
}

