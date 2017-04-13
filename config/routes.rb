Rails.application.routes.draw do
  mount LikeDislike::Engine, at: '/'


  root   'static_pages#home'
  resources :categories
  resources :phrases do
  resources :examples
  end
resources :users



  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
end
