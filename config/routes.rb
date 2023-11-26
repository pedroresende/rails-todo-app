Rails.application.routes.draw do
  devise_for :users

  root "todo_lists#index"

  resources :todo_lists do
    resources :todos
  end

  get "/todo_lists/:id/hide" => "todos#hide"

  get "/todo_lists/:id/show" => "todos#show"

  post "/check/:id" => "todos#check"

  post "/uncheck/:id" => "todos#uncheck"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
