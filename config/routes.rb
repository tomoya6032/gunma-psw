Rails.application.routes.draw do
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  
  
  root to: 'toppage#index'
  resource :timeline, only: [:show]

  get '/history', to: 'chat_histories#show'
  resource :history, only: [:show]


 resources :articles do
   resources :comments, only: [:index, :new, :show, :edit, :create, :update, :destroy]
   resource :like, only: [:show, :create, :destroy]

 end

 resources :accounts, only: [:show] do
   resources :follows, only: [:create]
   resources :unfollows, only: [:create]
 end


 resources :chats do
   resources :replies, only: [:index, :new, :show, :edit, :create, :update, :destroy]
   resource :favorite, only: [:show, :create, :destroy]
 end
 
 resources :informations do
   resource :like, only: [:create, :destroy]
 end
 
 resources :lectures, only: [:index, :new, :show, :edit, :create, :update, :destroy]
 
 resources :favorites, only: [:index]
 resource :profile, only: [:show, :edit, :update]
 
 
end
