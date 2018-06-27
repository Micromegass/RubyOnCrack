Rails.application.routes.draw do

root 'questions#index'
resources :questions
resources :answers, only: [:create, :new] 

end
