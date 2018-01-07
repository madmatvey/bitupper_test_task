Rails.application.routes.draw do

  root 'blocks#index'
  resources :block, :controller=>"blocks"
  resources :tx, :controller=>"txes"
  resources :addresses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
