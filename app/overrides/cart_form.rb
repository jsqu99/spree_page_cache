Deface::Override.new(:virtual_path => 'spree/products/show',
                     :name => 'add_authenticity_token_to_form',
                     :insert_after => '[data-hook="product_show"]',
                     :text => %(
                     <%= javascript_include_tag 'store/authenticity_token' %>
                     )
                     )
