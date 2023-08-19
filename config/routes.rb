Rails.application.routes.draw do
  devise_for :users
  resources :airfryers

  root 'airfryers#index'



  # get '/posts/hashtag/:name', to: 'posts#hashtags'
  get '/airfryers/af_hashtags/:name', to:'airfryers#hashtags'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
