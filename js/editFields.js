$(document).ready(function() {
    /*** Elements ***/
    // Inputs
    var $newOptionValue = $("#newOptionValue");
    var $btAddOptionValue = $("#bt_addOptionValue");

    
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
                    id: ,
					optionValue: optionValue
                }
            }).done(function(data) {
                var result = parseInt(data);
                // check if result is an integer
                if (Number(result) === result && result%1 === 0){
                    // Add new row to table
                    var newRow = 
                        '<tr id="tr-' + result + '">' +
                            '<td class="edit">' + inputValue + '</td>' +
                            '<td><button id="bt-' + result + '"type="button" class="btn btn-default btDeleteChurch">' +
                                    '<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>' +
                                '</button></td>' +
                        '</tr>';
                    $("#churches > tbody:last").append(newRow);
                    
                }
                
                // Clear input
                $newChurchInput.val("");
                $("table").trigger("update");
                $('.edit').editable('../Ajax/Admin/editChurch.php', {
                    submit : 'OK'
                });
            });
        }
        else {
            $newChurchInput.parent().removeClass('has-error');
            var inputValue = $newChurchInput.val();
            
            
        }
    });
    
    /**
     * Delete a row from the caChurches
     */
    $("#churches").on("click", "button.btDeleteChurch", function () {
        var churchID = $(this).attr('id').split("-")[1];
        $.ajax({
            type: "POST",
            url: "../Ajax/Admin/deleteChurch.php",
            data: {
                churchID: churchID
            }
        }).done(function(data) {
            if (data.indexOf("success") !== -1) {
                $("tr#tr-" + churchID).remove();
                $("table").trigger("update");
                displayAlertWithText($successMessage, "The church was deleted successfully.")
            }
            else {
                displayAlertWithText($dangerMessage, "The church could not be deleted.")
            }
        });
    });
    
    
    /**
     * Makes the field editable
     */
    $('.edit').editable('../Ajax/Admin/editChurch.php', {
         submit : 'OK'
     });
});

function displayAlertWithText(element, text) {
    element.find(".alertText").text(text);
    element.alert();
    element.fadeTo(4000, 500).slideUp(500, function() {
        element.hide();
    });  
}