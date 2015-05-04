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
							<tr>
								<td>{$line.Title}</td>
								
								{if ($line.Narrative_Line1 == '' OR $line.Narrative_Line1 == 'NULL') AND
										($line.Narrative_Line2 == '' OR $line.Narrative_Line2 == 'NULL')}
									<td id="{$line.Field_ID}-{$line.Title}" class="edit">
									</td>
								{else}
									<td id="{$line.Field_ID}-{$line.Title}-{$line.Narrative_ID}" class="edit">
										{$line.Narrative_Line1}{literal}{{/literal}{$line.Title}{literal}}{/literal}{$line.Narrative_Line2}
									</td>
								{/if}
								
								
								<td><button type="button" class="btn btn-default btDeleteOption">
										<span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
									</button>
									<button type="button" class="btn btn-default btDeleteOption">
										<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span>
									</button>
								</td> 
							</tr>
						{/foreach}
					
					</tbody>
				</table>
					
			</div>
			
			
		</div>
		
	</body>
</html>