<?php

require_once '../config.php';

$optionID = filter_input(INPUT_POST, 'optionID'); 
$optionValue = filter_input(INPUT_POST, 'optionValue'); 

$insertQuery = $dbConnection->prepare("
    INSERT INTO field_options
    (Field_ID, Choose_Options) VALUES (:id, :optionsValue)" );

$insertQuery->bindParam(":id", $optionID);
$insertQuery->bindParam(":optionsValue", $optionValue);
$insertQueryResult = $insertQuery->execute();


if ($insertQueryResult) {
	
	$getOptionID = $dbConnection->prepare("SELECT LAST_INSERT_ID()" );
	$getOptionID->execute();
	$optionID = $getOptionID->fetch(PDO::FETCH_ASSOC);
	echo $optionID["LAST_INSERT_ID()"];
}

