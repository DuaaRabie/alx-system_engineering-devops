# automate puppet to fix php configuration error

exec { 'Fix Wordpress Site':
	command  => 'sed -i "s/.phpp/.php" /var/www/html/wp-settings.php',
	provider => shell,
}
