Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, :defaults => {:format => :json} do
    resources :users
  	post   :signin,  to: 'sessions#create'
    delete :signout, to: 'sessions#destroy'

    resources :books do
    	get :search , on: :collection
    end
  end


end
