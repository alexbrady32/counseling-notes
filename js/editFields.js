$(document).ready(function() {
    /*** Elements ***/
    // Inputs
    var $newOptionValue = $("#newOptionValue");
    var $btAddOptionValue = $("#bt_addOptionValue");
	
	
	/**
     * Display the options div	 
     */
	var optionsDiv = $("#test");
	optionsDiv.hide();
	$("#fieldNames").on("click", ".fieldName", function () {
		//console.log($(this).parent());
        var selectedFieldNameID = $(this).parent().attr('id');
		var selectedFieldName;
		for (var i=0; i < fieldNames.length; i++){
			if (fieldNames[i]["Field_ID"] === selectedFieldNameID){
				selectedFieldName = fieldNames[i]["Title"];
				break;
			}
		}
		
        $("#selectedFieldHeader").text(selectedFieldName);
		
		$.ajax({
                type: "POST",
                url: "ajax/getOptionValues.php",
                data: {
					field_ID: selectedFieldNameID
                }
		}).done(function(data){
			
			var fieldOptionsData = JSON.parse(data);
			
			var tableRowsString = '';
			for(var i = 0; i < fieldOptionsData.length; i++){
				tableRowsString += '<tr id="tr-' + fieldOptionsData[i]["FieldOption_ID"] + '">' +
										'<td class="edit" id="' + fieldOptionsData[i]["FieldOption_ID"] + '">' + fieldOptionsData[i]["Choose_Options"] + '</td>' +
										'<td><button id="bt-' + fieldOptionsData[i]["FieldOptionID"] + '"type="button" class="btn btn-default btDeleteOption">' +
												'<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>' +
											'</button></td>' +
									'</tr>'
			}
			
			$('#fieldOptionsTable tbody tr').remove();
			$('#fieldOptionsTable > tbody:last').append(tableRowsString);
			$("#fieldOptionsTable").trigger("update");
		});
		
		// TODO:
		// The problem with this is that you can never close the div once it is open
		if (!optionsDiv.is(":visible")){
			optionsDiv.toggle();
		}

		
    });
    
    /**
     * Insert a new row to field_options
     */
    $btAddOptionValue.click(function() {
        if ($newOptionValue.val().length !== 0) {
			var optionValue = $newOptionValue.val();
			$.ajax({
                type: "POST",
                url: "../ajax/insertOptionValue.php",
                data: {
                   
					optionValue: optionValue
                }
            }).done(function(data) {
                var result = parseInt(data);
                // check if result is an integer
                if (Number(result) === result && result%1 === 0){
                    // Add new row to table
                    var newRow = 
                        '<tr id="tr-' + result + '">' +
                            '<td class="edit">' + optionValue + '</td>' +
                            '<td><button id="bt-' + result + '"type="button" class="btn btn-default btDeleteOption">' +
                                    '<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>' +
                                '</button></td>' +
                        '</tr>';
					// Which table do we append to?
                    $("#churches > tbody:last").append(newRow);
                    
                }
                
                // Clear input
                $newOptionValue.val("");
                $("table").trigger("update");
                $('.edit').editable('../ajax/editOptionValue.php', {
                    submit : 'OK'
                });
            });
        }
    });
    
    /**
     * Delete a row from the field_options
     */
	 // Which table??
    $("#churches").on("click", "button.btDeleteOption", function () {
        var optionID = $(this).attr('id').split("-")[1];
        $.ajax({
            type: "POST",
            url: "../ajax/deleteOptionValue.php",
            data: {
                optionID: optionID
            }
        }).done(function(data) {
            if (data.indexOf("success") !== -1) {
                $("tr#tr-" + optionID).remove();
                $("table").trigger("update");
            
            }

        });
    });
    
    
    /**
     * Makes the field editable
     */
    $('.edit').editable('ajax/editOptionValue.php', {
         submit : 'OK'
	});
});

