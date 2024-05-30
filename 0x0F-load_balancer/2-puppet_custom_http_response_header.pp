# automate task-0

exec { 'update system':
	command => '/usr/bin/apt-get update',
}

package { 'nginx':
	ensure  => 'installed',
	require  => Exec['update system'],
}

exec { 'HTTP header':
	command  => 'sed -i "42i\	add_header X-Served-By  $(hostname);" /etc/nginx/sites-available/default',
	provider => 'shell',
}

service { 'nginx':
	ensure  => 'running',
	enable  => true,
	require => Package['nginx'],
}
