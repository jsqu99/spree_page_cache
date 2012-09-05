Spree::Core::Engine.routes.prepend do
  post '/page_caching_info', :to => 'page_caching_info#index'
end
