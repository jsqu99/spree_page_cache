var App = App || {};

App.updateCartAmount = function(value) {
  if (value) {
    $('#link-to-cart').html(value);
  }
};

App.updateAccountStatusBar = function(current_user_present) {
  if(current_user_present == "true"){
    $('#nav-bar li.logout').show();
    $('#nav-bar li.account').show();
    $('#nav-bar li.login').hide();
  } else {
    $('#nav-bar li.login').show();
    $('#nav-bar li.logout').hide();
    $('#nav-bar li.account').hide();
  }
};

$(function(){

  $.ajax({
    url: '/page_caching_info',
    type: 'POST',
    cache: false,
    dataType: 'json',
    success: function(data){
      App.updateCartAmount(decodeURIComponent(data.cart_amount));
      App.updateAccountStatusBar(decodeURIComponent(data.current_user_present));
    }
  });

});

