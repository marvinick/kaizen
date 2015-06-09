Rails.application.routes.draw do

  resources :items
  resources :comments
  resources :tastes

  devise_for :users, controllers: { registrations: "registrations"}

  root 'pages#home'
  get 'dashboard', to: "pages#dashboard"

  #get 'graph/index'
  #get 'graph/data', :defaults => { :format => 'json' }
end