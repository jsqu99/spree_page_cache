Spree::Core::Engine.routes.prepend do
  get '/page_caching_info', :to => 'page_caching_info#index'
  get '/authenticity_token', :to => 'page_caching_info#authenticity_token'
end
