$(document).ready(function() {
	 /**
     * Makes the narrative text fields editable
     */
    $('.edit').editable(	
		function(value, settings){
            var selectedId = $(this).attr("id");
			var narrativeLine = $(this);
            $.ajax({
                url:'ajax/editNarrativeLine.php',
                type:'POST',   
                data:{
                        id: $(this).attr("id"),
                        value : value,
						lastSeqNumber	: $('.hasSequence:last').parent().index(),
                    }
               
            }).done(function(data) {
				
				var result = parseInt(data);
                // check if result is an integer
                if (Number(result) === result && result%1 === 0){
					narrativeLine.addClass('hasSequence');
					narrativeLine.attr("id", selectedId + "-" + result);
				}
				
			});
			
			
            return value;
        } ,
        {
			placeholder: '', 
			submit: 'OK',
			data: function(string){
				return string;
			},
	});
	
	var changeNarrativeOrder = function () {
		var selectedRow = $(this).parent().parent();
		var idArray = $(this).attr('id').split("-");
		var operation = $(this).attr('id').split("-")[1];
		if (idArray.length === 3){
			var narrativeID = $(this).attr('id').split("-")[2];
			
			
			var index = $(this).parent().parent().index();

			if (operation === "down" || (operation ==="up" && index !== 0)){
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
			}
		}
		else{
			if (operation === "down"){
					selectedRow.next().after(selectedRow);
			}
			else{
				selectedRow.prev().before(selectedRow);
			}
		}
        
		
	};
	
	$("#narrativeLines").on("click", "button.btMoveUp", changeNarrativeOrder);
	$("#narrativeLines").on("click", "button.btMoveDown", changeNarrativeOrder);
	
	
});