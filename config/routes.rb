Rails.application.routes.draw do
  
  root 'welcome#index'

  # omniauth
  get '/auth/:provider/callback' => 'customer_sessions#create'
  get '/auth/failure' => 'customer_sessions#failure'

  # Custom logout
  match '/logout', :to => 'customer_sessions#destroy', via: :all
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
