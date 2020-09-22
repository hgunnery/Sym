Rails.application.routes.draw do
  resources :users
  root :to => 'homepage#index'
  get "initial_setup" => "homepage#initial_setup"

  resources :sessions

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "signup" => "homepage#new", :as => "signup"
end
