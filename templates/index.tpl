<html>
	<head>
		<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>	
		<script type="text/javascript" src="js/jquery.jeditable.mini.js"></script>			
		<script type="text/javascript" src="js/editFields.js"></script>
				
		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		{literal}
		<script type="text/javascript">
			var fieldNames = {/literal}{$fieldNamesJSON}{literal};
		</script>
		<style>
			.tableContainer{
				display: inline-block;
				max-height: 400px;
				overflow-y: auto;
			}
		</style>

		{/literal}
	</head>
	<body>
		<div class="container">
			<h2> Form Fields </h2>
			</br>
			<div class = "row">
				<div class="col-md-4">
					<br/>
					<table id="fieldNames" class="table">
						
						{foreach from=$fieldNames key=key item=field}
							<tr>
								<td id={$field.Field_ID}><a class="fieldName"> {$field.Title}</a></td>
								
							</tr>
						{/foreach}
					</table>
				</div>
				<div id="test" class="col-md-4">
					<h4 id="selectedFieldHeader"></h4>
					<div class="tableContainer">
						<table id="fieldOptionsTable" class="table">
							<thead>
								<tr>
									<th>Field Options</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
							
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
		</div>
		
	</body>
</html>