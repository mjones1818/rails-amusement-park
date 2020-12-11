Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'
  get '/users/new', to: 'users#new', as: 'signup'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  post 'users/:id', to: 'users#show'
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  get '/attractions', to: 'attractions#index', as: 'attractions'
  post '/attractions', to: 'attractions#create'
  get '/attractions/new', to: 'attractions#new', as: 'new_attraction'
  get '/attractions/:id', to: 'attractions#show', as: 'attraction'
  get 'attractions/:id/edit', to: 'attractions#edit', as: 'edit_attraction'
  patch 'attractions/:id', to: 'attractions#update'
  delete '/logout', to: 'sessions#logout', as: 'logout'
end
