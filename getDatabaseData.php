<?php

$dbConnection = new PDO('mysql:dbname=session_note;host=localhost;charset=utf8', 'root', 'SessionNotes15');
$table = filter_input(INPUT_GET, 'table');


$fieldNames = [];
$selectQuery = '';

$tableNamesQuery = $dbConnection->prepare( "
		SELECT `COLUMN_NAME` 
		FROM `INFORMATION_SCHEMA`.`COLUMNS` 
		WHERE `TABLE_NAME` = :tableName");
$tableNamesQuery->bindParam(":tableName", $table);
$tableNamesQuery->execute();



while ($attributeName = $tableNamesQuery->fetch()) {
	$name = $attributeName['COLUMN_NAME'];
	$selectQuery .= $table.'.'.$name.', ';
	
	
}
    
$selectQuery = substr($selectQuery, 0, -2);

$dataQuery = $dbConnection->prepare("
        SELECT ".$selectQuery." 
        FROM ".$table
		);

$dataQuery->execute();
$jsonData = array();
while ($row = $dataQuery->fetch(PDO::FETCH_ASSOC)) {
	array_push($jsonData, $row);
}

	
echo json_encode($jsonData);