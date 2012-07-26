

	$(function() {
		
		ApplayBasketEvents()
	});


	function ApplayBasketEvents(){
		var coll = $(".selectbutton");
		coll.each(function(i, item){
			$(item).click(function() {
			  var id = $(this).attr("dataid");
			  	$.ajax({
					url: "/basket/add/"+ id,
					success: function(response){
					ApplayShoppingCart();
					 }
				});
			});
		});

	}

	function ApplayShoppingCart(){
			$.ajax({
					url: "/book/cart/",
					context: $('#Cart'),
					success: function(response){
					$(this).html(response)
					 }
				});

	}
