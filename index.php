<?php
	include("config.php");
	
	$getFieldNames = $dbConnection->prepare("SELECT Field_ID, Title FROM fields");
	//$getFieldNames->bindParam(":email", $email);
	$getFieldNames->execute();
	$fieldNames = $getFieldNames->fetchall(PDO::FETCH_ASSOC);


	
	$smarty->assign('fieldNames', $fieldNames);
	$smarty->display('index.tpl');