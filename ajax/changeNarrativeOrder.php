<?php

require_once '../config.php'; 

$narrativeID = filter_input(INPUT_POST, 'narrativeID');
$operation = filter_input(INPUT_POST, 'operation');
$sequenceNum = filter_input(INPUT_POST, 'index');


// Update the first narrative
if ($operation == 'up'){
	
	$findSecondNarrative = $dbConnection->prepare("
	SELECT Narrative_ID FROM narrative WHERE Seq_Number = :sequenceNum");
	$secondSequenceNum = $sequenceNum - 1 ;
	$findSecondNarrative->bindParam(":sequenceNum", $secondSequenceNum);
	$secondNarrativeResult = $findSecondNarrative->execute();
	
	$updateSequence = $dbConnection->prepare("
    UPDATE narrative
	SET Seq_Number = Seq_Number - 1
	WHERE Narrative_ID = :narrativeID");
	
	
}
else{
	$findSecondNarrative = $dbConnection->prepare("
	SELECT Narrative_ID FROM narrative WHERE Seq_Number = :sequenceNum");
	$secondSequenceNum = $sequenceNum + 1 ;
	$findSecondNarrative->bindParam(":sequenceNum", $secondSequenceNum);
	$secondNarrativeResult = $findSecondNarrative->execute();
	
	$updateSequence = $dbConnection->prepare("
    UPDATE narrative
	SET Seq_Number = Seq_Number + 1
	WHERE Narrative_ID = :narrativeID");
	
	
}

if ($secondNarrativeResult){
	$updateSequence->bindParam(":narrativeID", $narrativeID);
	$result = $updateSequence->execute();


	$secondNarrativeID = $findSecondNarrative->fetch(PDO::FETCH_ASSOC);
	// Update the other narrative
	if ($operation == 'up'){
		$updateSequence = $dbConnection->prepare("
		UPDATE narrative
		SET Seq_Number = Seq_Number + 1
		WHERE Narrative_ID = :secondNarrativeID");
		$updateSequence->bindParam(":secondNarrativeID", $secondNarrativeID["Narrative_ID"] );
	}
	else{
		$updateSequence = $dbConnection->prepare("
		UPDATE narrative
		SET Seq_Number = Seq_Number - 1
		WHERE Narrative_ID = :secondNarrativeID");
		$updateSequence->bindParam(":secondNarrativeID", $secondNarrativeID["Narrative_ID"] );
	}

	$result = $updateSequence->execute();
}



