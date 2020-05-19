Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :bookmarks
  resources :user_bookmarks
  
  get '/logged_in', :to => 'sessions#is_logged_in?'
  delete '/logout', :to => 'sessions#destroy'
  post '/login', :to => 'sessions#create'
  post '/your_bookmarks', :to => 'sessions#user_bookmarks'
  
end
