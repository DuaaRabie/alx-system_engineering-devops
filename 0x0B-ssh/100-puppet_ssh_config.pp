#Client configuration file (w/ Puppet)

file_line { 'SSH Private Key Configuration':
  path => '/home/ubuntu/.ssh/config',
  line => 'IdentityFile ~/.ssh/school',
  ensure => 'present',
}

file line { 'Declare identity file':
  path => '/home/vagrant/.ssh/config',
  line => 'IdentityFile ~/.ssh/school',
}

file_line { 'Turn off passwd auth':
  path => '/home/vagrant/.ssh/config',
  line => 'PasswordAuthentication no',
}
