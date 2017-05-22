Rails.application.routes.draw do
  resources :dispatches do 
  	resources :comments
  end
  devise_for :users
  root 'dispatches#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
