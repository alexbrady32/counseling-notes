<?php

	$dbConnection = new PDO('mysql:dbname=session_note;host=localhost;charset=utf8', 'root', 'SessionNotes15');

	// load Smarty library
	require('Smarty.class.php');
	$smarty = new Smarty;
	$smarty->template_dir = 'C:/xampp/htdocs/session_notes/templates';
	$smarty->config_dir = 'C:/xampp/htdocs/session_notes/config';
	$smarty->cache_dir = 'C:/xampp/smarty/cache';
	$smarty->compile_dir = 'C:/xampp/smarty/templates_c';
