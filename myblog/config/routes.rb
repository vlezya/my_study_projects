Rails.application.routes.draw do
  # get '/questions', to: 'questions#index'
  # get '/questions/new', to: 'questions#new'
  # post '/questions', to: 'questions#create'
  # get '/questions/:id/edit', to: 'questions#edit'

  # resources :questions, only: %i[index new edit create update destroy show]
  resources :users, only: %i[new create]
  resources :questions do
    resources :answers, only: %i[create destroy edit update]
  end
  root 'pages#index'

end
