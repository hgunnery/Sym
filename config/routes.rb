Rails.application.routes.draw do
  resources :users
  root :to => 'homepage#index'
  get "initial_setup" => "homepage#initial_setup"
end
