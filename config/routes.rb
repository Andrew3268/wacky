Rails.application.routes.draw do
  devise_for :users
  resources :airfryers

  root 'airfryers#index'
  
  
  get '/airfryers/af_hashtags/:name', to:'airfryers#hashtags'


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
