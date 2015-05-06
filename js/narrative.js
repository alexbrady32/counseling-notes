$(document).ready(function() {
	 /**
     * Makes the narrative text fields editable
     */
    $('.edit').editable(	
		function(value, settings){
            var selectedId = $(this).attr("id");
			
            $.ajax({
                url:'ajax/editNarrativeLine.php',
                type:'POST',   
                data:{
                        id: $(this).attr("id"),
                        value : value,
						lastSeqNumber	: $('.hasSequence:last').index(),
                    },
                dataType: "JSON",
				async:false,
               
            }).done(function(data) {
                    // TODO
					// Add hasSequence class to new value
					console.log("test");
					selectedId.addClass('hasSequence');
					
			});
			console.log("test2");
            return value;
        } ,
        {
			placeholder: '', 
			submit: 'OK',
			data: function(string){
				return $.trim(string);
			},
	});
	
	var changeNarrativeOrder = function () {
		var selectedRow = $(this).parent().parent();
        var narrativeID = $(this).attr('id').split("-")[0];
		var operation = $(this).attr('id').split("-")[1];
		var index = $(this).parent().parent().index();
	
        $.ajax({
            type: "POST",
            url: "ajax/changeNarrativeOrder.php",
            data: {
                narrativeID : narrativeID,
				operation	: operation,
				index		: parseInt(index)
            }
        }).done(function(data) {
            if (operation === "down"){
				selectedRow.next().after(selectedRow);
			}
			else{
				selectedRow.prev().before(selectedRow);
			}

        });
	};
	
	$("#narrativeLines").on("click", "button.btMoveUp", changeNarrativeOrder);
	$("#narrativeLines").on("click", "button.btMoveDown", changeNarrativeOrder);
	
	
});