Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  get 'articles/show'
  mount ActionCable.server => "/cable"
  root 'static_pages#home'
  get  '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :articles, only: [:index, :show, :new, :create, :destroy]
  
  resources :users
  get 'users/:id/edit/:name', controller: 'users', action: 'edit'
  
  # get 'boards/option/:name', controller: 'boards', action: 'index'
  
  resources :boards, only: [:index, :show, :new, :create] do
    resources :posts, only: [:new, :create]
  end
  
  get 'rooms/new/:id', controller: 'rooms', action: 'new'
  
  resources :rooms, only: [:index, :create, :show] do
   resources :messages, only: [:create]
  end
  
  
end