#!/usr/bin/env bash
# automate task-0

exec { 'update system':
	command => '/usr/bin/apt-get update',
}

package { 'nginx':
	ensute  => 'installed',
	requiew => Exec['update system'],
}

file { '/etc/nginx/sites-available/default':
	ensure => absent,
}

file { '/var/www/html/custom_404.html':
	ensure  => file,
	content => "Ceci n'est pas une page",
}

file { '/var/www/html/index.html':
	content => 'Hello World!',
	require => Package['nginx'],
}

file { '/etc/nginx/sites-available/new':
	ensure => file,
	owner => 'root',
	group => 'root',
	mode    => '0644',
	content => '
	server {
		listen 80 default_server;
		root /var/www/html;
		# Add index.php to the list if you are using PHP
		index index.html index.htm index.nginx-debian.html;
		server_name _;
		add_header X-Served-By \$host;
		error_page 404 /custom_404.html;
		location = /custom_404.html {
			root /var/www/html;
			internal;
		}
	}',
	require => Package['nginx'],
}

service { 'nginx':
	ensure  => running,
	ensure  => true,
	require => Package['nginx'],
}
