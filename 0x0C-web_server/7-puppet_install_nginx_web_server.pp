#Eure Nginx is installed
package { 'nginx':
 ensure => installed,
}

# Ensure Nginx is running
service { 'nginx':
 ensure     => running,
 enable     => true,
 hasrestart => true,
 hasstatus  => true,
 require    => Package['nginx'],
}

#Configure Nginx to listen on port 80
file { '/etc/nginx/sites-available/default':
 ensure  => file,
 content => template('nginx/default.erb'),
 notify  => Service['nginx'],
}

# Template for the default Nginx site configuration
file { '/etc/nginx/sites-available/default.erb':
 ensure => file,
 content => "
 server {
 	listen 80 default_server;
 	listen [::]:80 default_server;

 	root /var/www/html;
 	index index.html index.htm index.nginx-debian.html;

 	server_name _;

 	location / {
 		try_files \$uri \$uri/ =404;
	}

	location /redirect_me {
		return 301 http://duaatech.learn;
	}
 }
 ",
 }

# Ensure the default site is enabled
file { '/etc/nginx/sites-enabled/default':
 ensure  => link,
 target  => '/etc/nginx/sites-available/default',
 require => File['/etc/nginx/sites-available/default'],
 notify  => Service['nginx'],
}

#Ensure the default site is removed from sites-enabled if it's a broken link
file { '/etc/nginx/sites-enabled/default':
 ensure  => absent,
 require => File['/etc/nginx/sites-available/default'],
}

# Create the root directory for the default site
file { '/var/www/html':
 ensure => directory,
}

# Create a simple index.html file
file { '/var/www/html/index.html':
 ensure  => file,
 content => '<html><body><h1>Hello World!</h1></body></html>',
 require => File['/var/www/html'],
}
