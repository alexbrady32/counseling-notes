<?php

require_once '../config.php'; 

$narrativeID = filter_input(INPUT_POST, 'narrativeID');
$operation = filter_input(INPUT_POST, 'operation');
$sequenceNum = filter_input(INPUT_POST, 'index');

// Update the first narrative
if ($operation == 'up'){
	$updateSequence = $dbConnection->prepare("
    UPDATE narrative
	SET Seq_Number = Seq_Number - 1
	WHERE Narrative_ID = :narrativeID");
}
else{
	$updateSequence = $dbConnection->prepare("
    UPDATE narrative
	SET Seq_Number = Seq_Number + 1
	WHERE Narrative_ID = :narrativeID");
}


$updateSequence->bindParam(":narrativeID", $narrativeID);
$result = $updateSequence->execute();


// Update the other narrative
if ($operation == 'up'){
	$updateSequence = $dbConnection->prepare("
    UPDATE narrative
	SET Seq_Number = Seq_Number + 1
	WHERE Seq_Number = :sequenceNum");
	$otherSequenceNum = $sequenceNum - 1;
	$updateSequence->bindParam(":sequenceNum", $otherSequenceNum );
}
else{
	$updateSequence = $dbConnection->prepare("
    UPDATE narrative
	SET Seq_Number = Seq_Number - 1
	WHERE Seq_Number = :sequenceNum");
	$otherSequenceNum = $sequenceNum + 1;
	$updateSequence->bindParam(":sequenceNum", $otherSequenceNum );
}

$result = $updateSequence->execute();

