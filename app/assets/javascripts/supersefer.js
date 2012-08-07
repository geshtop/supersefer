

	$(function() {
		
		ApplayBasketEvents();
		SelectShipping();
		$(".rb").change(function(){
			SelectShipping();
		});
		if($("#contact_form").length > 0){
			$("#contact_form").validate();
		}

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
						SelectShipping()
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
	function SelectShipping(){
		
		if($("#total_weight").length > 0){
		var totalproducts = $("#grand_total").val()*1;
		if(totalproducts==0)
		{
			location.href = ROOT_PATH

		}
		var totalweight = $("#total_weight").val() * 1;
		
		var shipping_wrapper = $(".shipping_wrapper");
		var trcoll = $(".ship_tr");
		var currentshipping = 0;
		trcoll.removeClass("current");
		shipping_wrapper.each(function(index, item){
			var rb = $(".rb", item);
			var ischecked = rb.is(":checked");
			if(ischecked){
				$(item).addClass("selected");
				var trs = $(".ship_tr", item);
				trs.each(function(i,it){
					if(totalweight>= $(it).attr("data-from") && totalweight<= $(it).attr("data-to"))
					{

						$(it).addClass("current");
						currentshipping =$(it).attr("data-price") * 1;
					}
				});

			}else{

				$(item).removeClass("selected");
			}
			$("#total_wrapper").text(totalproducts);
			$("#shipping_wrapper").text(currentshipping);
			$("#grand_total_wrapper").text(currentshipping + totalproducts);
		

		});
	}
	}

	
	
