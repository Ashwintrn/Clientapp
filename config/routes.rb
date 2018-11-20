Rails.application.routes.draw do
  get 'welcome/index'
  get 'orders/index', to: 'orders#index', as: 'index_order', :defaults => { :format => 'json'} 
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
