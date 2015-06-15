Rails.application.routes.draw do

  resources :items
  resources :comments
  resources :improves

  devise_for :users, controllers: { registrations: "registrations"}

  root 'pages#home'
  get 'dashboard', to: "pages#dashboard"
end