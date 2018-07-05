Rails.application.routes.draw do

resources :users, only: [:new, :create]
root 'questions#index'
resources :questions
resources :answers, only: [:create, :new] 

end
