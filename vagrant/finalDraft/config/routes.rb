require 'api_constraints'

Rails.application.routes.draw do
	mount Knock::Engine => "/knock"
	root 'users#index'


	resources :users
	resources :apikeys, only: [:new, :create]

	get 'apikeys' => 'apikeys#show' , as: :apikey
	post 'apikeys' => 'apikeys#destroy' , as: :destroy
	get 'newapp' => 'apikeys#new' , as: :newapp

	post 'login' => 'users#login', as: :login
	get  'logout' => 'users#logout', as: :logout


	namespace :api, defaults: { format: :json } do
		scope module: :v1, constrains: ApiConstraints.new(version: 1, default: true) do

			resources :systembolags, only: [:show, :index, :create, :new, :destroy, :update] do
				resources :positions, only: [:index]
				resources :tags, only: [:index]
			end
			resources :positions, only: [:show, :index, :create, :new, :destroy, :update]
			resources :tags, only: [:show, :index, :create, :new, :destroy, :update] do
				resources :systembolags, only: [:index]
			end
			resources :creators, only: [:show, :index] do
				resources :systembolags, only: [:index]
			end

		end
	end
end
