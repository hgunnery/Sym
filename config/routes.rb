Rails.application.routes.draw do

  resources :suggestions do
		resources :votes
  	member do
			post "completed"
			post "incomplete"
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
	get "blog" => "homepage#blog", :as => "blog"
	resources :accounts

  namespace :admin do
    get "homepage" => "homepage#index"
		resources :cores
		resources :rewards
    resources :supporter_levels do
    	member do
    		get "rewards"
    	end
    end
		resources :users
		resources :posts do
			member do
				post "publish"
			end
		end
  end
  resources :password_resets
end
