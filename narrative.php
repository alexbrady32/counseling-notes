<?php

	include("config.php");
	
	$getNarrativeLines= $dbConnection->prepare("SELECT fields.Title, fields.Field_ID, Narrative_ID, Narrative_Line1, 
													   Narrative_Line2, narrative.Seq_Number
												FROM fields
												LEFT OUTER JOIN narrative ON fields.Field_ID = narrative.Field_ID
												ORDER BY CASE WHEN narrative.Seq_Number IS NULL THEN 1 ELSE 0 END, narrative.Seq_Number;");
	$result = $getNarrativeLines->execute();
	$narrativeLines = $getNarrativeLines->fetchall(PDO::FETCH_ASSOC);
	
	
	$smarty->assign('narrativeLines', $narrativeLines);
	$smarty->assign('narrativeLinesJSON', json_encode($narrativeLines));
	$smarty->display('narrative.tpl');