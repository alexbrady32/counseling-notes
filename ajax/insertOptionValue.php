<?php

require_once '../config.php';

$optionID = filter_input(INPUT_POST, 'id'); 
$optionValue = filter_input(INPUT_POST, 'optionValue'); 

$insertQuery = $dbConnection->prepare("
    INSERT INTO field_options
    (Field_ID, Choose_Options) VALUES (:id, :optionsValue)" );

$insertQuery->bindParam(":id", $optionID);
$insertQuery->bindParam(":optionsValue", $optionsValue);
$insertQueryResult = $insertQuery->execute();


if ($insertQueryResult) {
    $getOptionID = "SELECT LAST_INSERT_ID()";
    $getOptionID = $dbExecutor->executeQuery($getOptionID);
    $optionID = $getOptionID->fetch_assoc();
    echo $optionID["LAST_INSERT_ID()"];
}
