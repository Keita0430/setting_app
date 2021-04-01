Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/review', to: 'static_pages#review'
  get  '/signup', to: 'users#new'
  resources :users
end
