Rails.application.routes.draw do

  get '/newest', to: 'phrases#newest'

  root   'static_pages#home'
  resources :categories
  resources :phrases do
  resources :examples
  end
resources :users

  resources :phrase do
    member do
      put "like", to: "phrases#upvote"
      put "dislike", to: "phrases#downvote"
    end
  end

  resources :phrases do
    resources :examples do
      member do
        put "like", to: "examples#upvote"
        put "dislike", to: "examples#downvote"
      end
    end
  end


  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
end
