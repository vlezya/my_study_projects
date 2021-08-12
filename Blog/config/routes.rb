Rails.application.routes.draw do
  resources :posts do
    resources :comments, except: %i[new show]
  end

  root 'pages#index'
end
