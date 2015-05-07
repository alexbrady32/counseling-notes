<html>
	<head>
		<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>	
		<script type="text/javascript" src="js/jquery.jeditable.mini.js"></script>
		<script type="text/javascript" src="js/narrative.js"></script>		
		
				
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

	</head>
	<body>
		<div class="container">
			<h2> Narrative </h2>
			</br>
			<div class="col-md-10">
				{literal}
				The fields of the form are listed below. Each field has a corresponding narrative line. This narrative is a template,
				so in order for the correct data to be displayed after a session, please put placeholder, using {} inclosed with the field name,
				(e.g. {Date}) to indicate where you would like the data from the form to go.
				{/literal}
				<br/>
				<table id="narrativeLines" class="table">
				
					<thead>
						<tr>
							<th>Field</th>
							<th>Narrative Text</th>
							<th></th>
						</tr>
					</thead>
					
					<tbody>
					
						{foreach from=$narrativeLines key=key item=line}
							<tr id="{$line.Field_ID}">
								<td>{$line.Title}</td>
								
								{if ($line.Narrative_Line1 == '' AND $line.Narrative_Line2 == '' AND !isset($line.Narrative_ID))}
									<td id="{$line.Field_ID}-{$line.Title}" class="edit">
									</td>
								{else if ($line.Narrative_Line1 == '' AND $line.Narrative_Line2 == '')}
									<td id="{$line.Field_ID}-{$line.Title}-{$line.Narrative_ID}" class="edit hasSequence">
									</td>
								{else}
									<td id="{$line.Field_ID}-{$line.Title}-{$line.Narrative_ID}" class="edit hasSequence">
										{$line.Narrative_Line1}{literal}{{/literal}{$line.Title}{literal}}{/literal}{$line.Narrative_Line2}
									</td>
								{/if}
								
								{if isset($line.Narrative_ID)}
									<td><button type="button" id="{$line.Field_ID}-up-{$line.Narrative_ID}" class="btn btn-default btMoveUp">
											<span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
										</button>
										<button type="button" id="{$line.Field_ID}-down-{$line.Narrative_ID}" class="btn btn-default btMoveDown">
											<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
										</button>
									</td> 
								{else}
									<td><button id="{$line.Field_ID}-up" type="button" class="btn btn-default btMoveUp">
											<span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
										</button>
										<button id="{$line.Field_ID}-down"type="button" class="btn btn-default btMoveDown">
											<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
										</button>
									</td> 
								{/if}
							</tr>
						{/foreach}
					
					</tbody>
				</table>
					
			</div>
			
			
		</div>
		
	</body>
</html>