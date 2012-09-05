module Spree
  OrdersController.class_eval do
    # worst thing that can happen is an attacker can add/remove an item from the cart.
    # I'm trading off that possibility for the ability to cache the product detail page
    skip_before_filter :verify_authenticity_token, :only => :populate
  end
end
