Rails.application.routes.draw do
 
  devise_for :users
  namespace :devise, :path => "/" do
    #Registrations
    post 'sign_up' => 'registrations#create' 

    #Sessions
    get 'login' => 'sessions#new'
    post 'login'  => 'sessions#create'

    
  end

  namespace :admin do
    resources :posts
  end
  
  get '/index' => 'posts#index'
  root to: 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
