# fix php configuration error with puppet automation

exec { 'Fix site':
	command  => 'sed -i "s/.phpp/.php/" /var/www/html/wp-settings.php',
	provider => shell,
}
