Rails.application.routes.draw do
  root 'questions#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :comments, only: [:create, :new]
  resources :users, only: [:new, :create]
  
  resources :questions do 
    resource :vote, only: [:new, :create, :destroy]
  end 

  resources :answers, only: [:create, :new] do 
      resource :vote, only: [:new, :create, :destroy]

  post 'answers/:id/voteup' => 'answers#voteup', as: 'vote_answer'
  post 'answers/:id/votedown' => 'answers#votedown', as: 'delete_vote_answer'
  end 


end
