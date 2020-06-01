Rails.application.routes.draw do
	resources :dresses

	root to: "dresses#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
