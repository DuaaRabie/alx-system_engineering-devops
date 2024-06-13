# fix nginx limit

exec { 'Fix nginx':
  command  => 'sudo sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 3000\"/"',
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
