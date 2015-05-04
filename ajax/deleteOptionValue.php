<?php

require_once '../config.php'; 

$optionID = filter_input(INPUT_POST, 'optionID');

$deleteQuery = $dbConnection->prepare("
    DELETE FROM field_options
    WHERE FieldOption_ID = :optionID");

$deleteQuery->bindParam(":optionID", $optionID);
$deleteQueryResult = $deleteQuery->execute();

if ($deleteQueryResult) {
    echo 'success';
}
else {
    echo 'failure';
}