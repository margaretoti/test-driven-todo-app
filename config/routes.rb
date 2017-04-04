Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "todos#index"

  resources :todos, only: [:new, :create]

  get "/sign_in", to: "sessions#new", as: :sign_in
  #resources :session, only: [:new] - why didn't we do it this way

  resources :sessions, only: [:create]
end
