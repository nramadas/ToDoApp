ToDo::Application.routes.draw do
  resources :users
  resources :tasks
  resources :tags, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]

  match 'signup' => 'users#new'
  match 'login' => 'sessions#new'
  match 'logout' => 'sessions#destroy'
end
