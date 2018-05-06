jQuery(document).ready(function($) {
	// Votre code ici avec les appels à la fonction $()

	// alert("hello wo");

	setInterval(getRemoteFriends, 1000);

	function getRemoteFriends() {
		$.getJSON('getFriends.php?key=paci.iut.1235', function(data) {
				//console.log(data);
				var color;
				var green_color = "#00ff00";
				var red_color = "#ffa98f";
				var text;
					
				$.each(data, function( index, item ) {
					// console.log(item.first_name);
					
					if((item.is_present) == 1){ 
						color = green_color;
						text = "Présent";
					}
					else {
						color = red_color;
						text = 'Absent';
					}
					$('.student#' + item.id).css("background-color",color);
					$('.student#' + item.id + ' td:nth-child(3)').html(text);
					
				});
			});
	}
	
	$(".student").on("click",function(){
		 
		var id = $(this).attr('id'); // or var clickedBtnID = this.id
		//alert(id);
   
   
		   $.getJSON('checkOrUncheck23213521.php?id=' + id, function(data) {
				//console.log(data);
				var color;
				var green_color = "#00ff00";
				var red_color = "#ffa98f";
				var text;
					
				$.each(data, function( index, item ) {
					// console.log(item.first_name);
					
					if((item.is_present) == 1){ 
						color = green_color;
						text = "Présent";
					}
					else {
						color = red_color;
						text = 'Absent';
					}
					$('.student#' + item.id).css("background-color",color);
					$('.student#' + item.id + ' td:nth-child(3)').html(text);
					
				});
			});
	   
	});

   
});
