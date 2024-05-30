# automate task-0

exec { 'update system':
	command => '/usr/bin/apt-get update',
}

package { 'nginx':
	ensure  => 'installed',
	require  => Exec['update system'],
}

#file { '/var/www/html/custom_404.html':
#	ensure  => 'file',
#	content => "Ceci n'est pas une page",
#}

#file { '/var/www/html/index.html':
#	content => 'Hello World!',
#	require => Package['nginx'],
#}

file { '/etc/nginx/sites-available/default':
	content => '
server {
	listen 80 default_server;
	root /var/www/html;
	# Add index.php to the list if you are using PHP
	index index.html index.htm index.nginx-debian.html;
	server_name _;
	add_header X-Served-By \$host;
	#error_page 404 /custom_404.html;
	#location = /custom_404.html {
	#	root /var/www/html;
	#	internal;
	#}
	#location /redirect_me {
	#	return 301 http://duaatech.learn/new_page;
	#}
	
	location / {
		try_files \$uri \$uri/ =404;
	}

}
	',
	require => Package['nginx'],
}

service { 'nginx':
	ensure  => 'running',
	enable  => true,
	require => Package['nginx'],
}
