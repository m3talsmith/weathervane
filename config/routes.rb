Rails.application.routes.draw do

  get "/forzip/:zip", to: "forecast#for_zip"
  post "/forzip", to: "forecast#for_zip"
  root "forecast#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
