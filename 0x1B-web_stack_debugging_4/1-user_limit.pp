# increase holberton user open file limit

exec { 'Fix nginx':
  command  => 'echo "holberton hard nofile 400000\nholberton soft nofile 200000" >> /etc/security/limits.conf',
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
