

	$(function() {
		
		ApplayBasketEvents();
			

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

		if($("#cartTable").length >0)
		{
					$.ajax({
					url: "/book/basketcart/",
					context: $('#cartTable'),
					success: function(response){
					$(this).html(response)
					 }
				});
		}	

	}

	function removeFromBasket(basketid){
				$.ajax({
					url: "/basket/remove/"+ basketid,
					success: function(response){
					ApplayShoppingCart();
					 }
				});

	}
	function updateQuantity(basketid, quanityid){
				$.ajax({
					url: "/basket/update_quantity/?id="+ basketid +"&quantity=" + quanityid,
					success: function(response){
					ApplayShoppingCart();
					 }
				});

	}

	function selectCategory(subcategoryid){
		


				$.ajax({
					url: "/book/index/"+ subcategoryid,
					context: $('#books_wrapper'),
					success: function(response){
					$(this).html(response)
					 }
				});
		}
	

	
	
