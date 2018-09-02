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
    patch '/publish' => 'posts#publish_unpublish_post'
  end
  
  get '/index' => 'posts#index'
  root to: 'posts#index'

  resources :post do
    resources :comments
  end

  get '/all_comments' => 'comments#show_all_comments'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
