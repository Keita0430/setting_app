Rails.application.routes.draw do
  mount ActionCable.server => "/cable"
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/review', to: 'static_pages#review'
  get  '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users
  
  resources :rooms, only: [:index, :show] do
   resources :messages, only: [:create]
  end
  
end
