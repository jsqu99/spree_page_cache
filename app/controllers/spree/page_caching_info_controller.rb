module Spree
  class PageCachingInfoController < Spree::BaseController
    ssl_allowed

    def index
      cart_amount = URI.escape(render_to_string(:partial => 'spree/shared/cart_data'))  # don't want screwed up plusses in my cookies
      cookies['cart_amount'] = cart_amount
      cookies['current_user_id'] = current_user.try(:id)

      respond_to do |format|
        format.js {
          render :json => { :cart_amount      => cart_amount, :current_user_id => current_user.try(:id)}
        }
      end
    end


    def authenticity_token
      session[:_csrf_token] ||= SecureRandom.base64(32)

      respond_to do |format|
        format.js {
          render :json => { :authenticity_token => session[:_csrf_token] }
        }
      end
    end

  end
end
