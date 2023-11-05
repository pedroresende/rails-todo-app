Rails.application.routes.draw do
  devise_for :users


  root "todos#index"

  resources :todos

  get "/hide" => "todos#hide"
  # post "/check/:id" => "application#check"

  # post "/uncheck/:id" => "application#uncheck"

  # get "/new" => "application#new"

  # get "/hide" => "application#hide"

  # post "/new" => "application#create"

  # get "/:id/edit",  to: "application#edit", as: "edit_todo"
  
  # put "/:id",  to: "application#update", as: "update_todo"

  # delete "/:id" => "application#delete"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
