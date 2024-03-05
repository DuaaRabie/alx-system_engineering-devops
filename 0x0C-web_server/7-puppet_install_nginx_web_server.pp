# Install Nginx
class { 'nginx':
 ensure => 'present',
}

# Ensure Nginx is running
service { 'nginx':
 ensure     => 'running',
 enable     => true,
 require    => Class['nginx'],
}

# Define a file resource for the index.html file
file { '/var/www/html/index.html':
 ensure => 'present',
 content => '<!DOCTYPE html><html><head><title>Hello World!</title></head><body><h1>Hello World!</h1></body></html>',
 require => File['/var/www/html'],
}

# Define a file resource for the Nginx configuration
file { '/etc/nginx/sites-available/default':
 ensure => 'present',
 content => template('nginx/default.erb'),
 notify => Service['nginx'],
}

# Ensure the default site is enabled
nginx::resource::server { 'default':
 ensure => 'present',
 listen_port => 80,
 server_name => 'localhost',
 www_root => '/var/www/html',
 index_files => ['index.html'],
}

# Set up a 301 redirect for /redirect_me
nginx::resource::location { 'redirect_me':
 ensure          => 'present',
 server          => 'default',
 location        => '/redirect_me',
 location_cfg_append => {
    'return' => '301 http://example.com',
 },
}
