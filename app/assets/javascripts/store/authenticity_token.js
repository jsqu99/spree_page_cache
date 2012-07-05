$(function(){

	$.ajax({
		url: '/authenticity_token',
		dataType: 'json',
		success: function(data){
      $("input[name=authenticity_token]").val(data.authenticity_token);
      $('meta[name=csrf-token]').attr('content',data.authenticity_token);
		}
	});

});
