# automate puppet to fix php configuration error

exec { 'Fix sit':
	command  => 'sed -i "s/.phpp/.php" /var/www/html/wp-settings.php; sudo service apache2 restart',
	provider => shell
}
