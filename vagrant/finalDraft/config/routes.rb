Rails.application.routes.draw do
  root 'users#index'


  resources :users
  resources :apikeys, only: [:new, :create]
  
  get 'apikeys' => 'apikeys#show' , as: :apikey
  post 'apikeys' => 'apikeys#destroy' , as: :destroy
  get 'newapp' => 'apikeys#new' , as: :newapp
  
  post 'login' => 'users#login', as: :login
  get  'logout' => 'users#logout', as: :logout

end
