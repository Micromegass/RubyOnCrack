Rails.application.routes.draw do
  root 'questions#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]
  resources :questions
  resources :answers, only: [:create, :new] 

end
