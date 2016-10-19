Rails.application.routes.draw do
  # get 'sessions/new'
  resources :sessions
  root 'welcome#index'
  post 'signup' => 'users#create'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
