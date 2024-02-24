#create a manifest that kills a process named killmenow.
exec { 'kill_killmenow_process':
  command => 'pkill killmenow',
  onlyif  => 'pgrep killmenow',
}
