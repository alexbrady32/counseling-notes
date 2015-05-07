<?php

require_once '../config.php'; 

$id = filter_input(INPUT_POST, 'id');
$value = filter_input(INPUT_POST, 'value');
$lastSeqNumber = filter_input(INPUT_POST, 'lastSeqNumber');

// id should be in the form field_id-field_title-narrative_id
// If the third part, narrative_id, does not exist, then it needs to be created
$id = explode('-', $id);


$valueSplit = explode('{'.$id[1].'}', $value);
$narrativeLine1 = $valueSplit[0];
if (count($valueSplit) == 2){
	$narrativeLine2 = explode('{'.$id[1].'}', $value)[1];
}
else{
	$narrativeLine2 = '';
}

if (count($id) == 3){
	$updateQuery = $dbConnection->prepare("
		UPDATE narrative 
		SET Narrative_Line1 = :narrativeLine1, Narrative_Line2 = :narrativeLine2 
		WHERE Field_ID = :fieldID");

	$updateQuery->bindParam(":narrativeLine1", $narrativeLine1);
	$updateQuery->bindParam(":narrativeLine2", $narrativeLine2);
	$updateQuery->bindParam(":fieldID", $id[0]);
	$updateQueryResult = $updateQuery->execute();
	
	if ($updateQueryResult) {
		echo $value;
	}
	else {
		echo 'failure';
	}
}

else if (count($id) == 2){
	if (is_null($lastSeqNumber)){
		$insertNarrative = $dbConnection->prepare("
			INSERT INTO narrative (Narrative_Line1, Narrative_Line2, Field_ID, Seq_Number)
			VALUES (:narrativeLine1, :narrativeLine2, :fieldID, 0)
			WHERE Field_ID = :fieldID");
	}
	else{
		$insertNarrative = $dbConnection->prepare("
			INSERT INTO narrative (Narrative_Line1, Narrative_Line2, Field_ID, Seq_Number)
			VALUES (:narrativeLine1, :narrativeLine2, :fieldID, :seq_number)");
		$newSeqNumber = $lastSeqNumber + 1;
		$insertNarrative->bindParam(':seq_number', $newSeqNumber);
	}
	$insertNarrative->bindParam(':narrativeLine1', $narrativeLine1);
	$insertNarrative->bindParam(':narrativeLine2', $narrativeLine2);
	$insertNarrative->bindParam(':fieldID', $id[0]);
	$insertNarrativeResult = $insertNarrative->execute();
	
	
	if ($insertNarrativeResult) {
		$getOptionID = $dbConnection->prepare("SELECT LAST_INSERT_ID()" );
		$getOptionID->execute();
		$optionID = $getOptionID->fetch(PDO::FETCH_ASSOC);
		echo $optionID["LAST_INSERT_ID()"];
	}

	
}




