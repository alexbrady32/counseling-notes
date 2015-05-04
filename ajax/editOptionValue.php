<?php

require_once '../config.php'; 

$id = filter_input(INPUT_POST, 'id');
$value = filter_input(INPUT_POST, 'value');


$updateQuery = $dbConnection->prepare("
    UPDATE field_options 
    SET Choose_Options = :value 
    WHERE FieldOption_ID = :id");

$updateQuery->bindParam(":value", $value);
$updateQuery->bindParam(":id", $id);
$updateQueryResult = $updateQuery->execute();



if ($updateQueryResult) {
    echo $value;
}
else {
    echo 'failure';
}