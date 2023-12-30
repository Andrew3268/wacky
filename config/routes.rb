Rails.application.routes.draw do
  
  
  resources :daily_savings do
    member do
      get 'happy_savings'
      get 'half_savings'
    end
  end

  resources :homes
  devise_for :users
  resources :airfryers

  root 'homes#index'
  # root 'airfryers#index'
  # root 'daily_savings'
  
  
  get '/airfryers/af_hashtags/:name', to:'airfryers#hashtags'
  get '/daily_savings/ds_hashtags/:name', to:'daily_savings#hashtags'
  


  # Hubs Link
  get 'hub/airfryers_recommend' 
  get 'hub/test_index' 
  get 'hub/test_index_02'
  get 'hub/wp_test'
  get 'hub/wp_page'

  get 'hub/authenticate_admin'

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
