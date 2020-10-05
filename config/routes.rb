Rails.application.routes.draw do
  resources :suggestions do
		resources :votes
  	member do
			post "completed"
			post "incomplete"
			post "up_vote"
			post "down_vote"
			get "banned"
			post "unban"
		end
		collection do
			get "all_completed"
			get "all_suggested"
			get "all_banned"
		end
  end

  root :to => 'homepage#index'
  get "initial_setup" => "homepage#initial_setup"

  resources :sessions

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "homepage#new", :as => "sign_up"
	get "dashboard" => "homepage#dashboard", :as => "dashboard"
	resources :accounts

  namespace :admin do
    get "homepage" => "homepage#index"
    resources :supporter_levels
		resources :users
  end
  resources :password_resets
end
