# fix nginx limit

exec { 'Fix nginx':
  command  => 'echo "* hard nofile 400000\n*soft nofile 200000" >> /etc/security/limits.conf',
  provider => shell,
}

exec { 'Reload nginx':
  command  => 'sudo service nginx reload',
  provider => shell,
}

exec { 'Restart nginx':
  command  => 'sudo service nginx restart',
  provider => shell,
}
