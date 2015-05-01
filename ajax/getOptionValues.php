<?php

require_once '../config.php';

$field_ID = filter_input(INPUT_POST, 'field_ID'); 

$getFieldOptions = $dbConnection->prepare("SELECT FieldOption_ID, Choose_Options FROM field_options 
										   WHERE Field_ID = :field_ID");
$getFieldOptions->bindParam(":field_ID", $field_ID);
$getFieldOptions->execute();
$fieldOptions = $getFieldOptions->fetchall(PDO::FETCH_ASSOC);

echo json_encode($fieldOptions);