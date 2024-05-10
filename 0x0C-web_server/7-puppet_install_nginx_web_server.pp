# update system
exec { 'update system':
 command => '/usr/bin/apt-get update',
}

# Ensure Nginx is installed
package { 'nginx':
 ensure  => installed,
 require => Exec['update system'] 
}

# Ensure Nginx is running
service { 'nginx':
 ensure     => running,
 require    => Package['nginx'],
}

# Template for the default Nginx site configuration
file { '/etc/nginx/sites-available/default':
 content => '
 server {
	listen 80 default_server;
 	listen [::]:80 default_server;

 	location / {
 		try_files \$uri \$uri/ =404;
	}
	
	location /redirect_me {
		return 301 http://duaatech.learn;
	}
 }
 ',
 require => Package['inginx'],
}

# Create a simple index.html file
file { '/var/www/html/index.html':
 content => 'Hello World!',
 require => File['/var/www/html'],
}

# Ensure Nginx is installed
 package { 'nginx':
 ensure  => installed,
 require => Exec['update system']
}
