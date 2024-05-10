# update system
exec { 'update system':
 command => '/usr/bin/apt-get update',
}

# Ensure Nginx is installed
package { 'nginx':
 ensure  => installed,
 require => Exec['update system'] 
}

# Template for the default Nginx site configuration
file { '/etc/nginx/sites-available/default':
 content => '
 server {
	listen 80 default_server;
 	listen [::]:80 default_server;

 	location / {
 		return 200 "Hello World!\n";
	}
	
	location /redirect_me {
		return 301 http://duaatech.learn;
	}
 }
 ',
 require => Package['nginx'],
}

# Create a simple index.html file
file { '/var/www/html/index.html':
 content => 'Hello World!',
 require => Package['nginx'],
}

# Ensure Nginx is running
 package { 'nginx':
 ensure  => running,
 require => Package['nginx']
}
