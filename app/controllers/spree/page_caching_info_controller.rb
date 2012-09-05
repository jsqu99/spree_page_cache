module Spree
  class PageCachingInfoController < Spree::BaseController
    ssl_allowed

    skip_before_filter :verify_authenticity_token

    def index
      cart_amount = URI.escape(render_to_string(:partial => 'spree/shared/cart_data'))  # don't want screwed up plusses in my cookies
      current_user_present = current_user.present? ? "true":"false"

      cookies['cart_amount'] = cart_amount
      cookies['current_user_present'] = current_user_present

      respond_to do |format|
        format.js {
          render :json => { :cart_amount      => cart_amount, :current_user_present => current_user_present}
        }
      end
    end
  end
end
