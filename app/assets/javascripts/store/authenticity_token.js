$('#add-to-cart-button').click(function() {

  var form = $(this).closest('form');

	$.ajax({
		url: '/authenticity_token',
    cache: false,
		dataType: 'json',
		success: function(data){
      $("input[name=authenticity_token]").val(data.authenticity_token);
      $('meta[name=csrf-token]').attr('content',data.authenticity_token);
      form.submit();
		}
	});
});

