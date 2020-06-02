Rails.application.routes.draw do

	resources :users
	resources :dresses

	get "/search", to: "dresses#search", as: "search"
	get "/login", to: "sessions#new", as: "login"
	post "/login", to: "sessions#create"
	get "/signup", to: "users#new", as: "signup"
	delete "/logout", to: "sessions#destroy", as: "logout"

	root to: "dresses#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
