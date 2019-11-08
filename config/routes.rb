Rails.application.routes.draw do
  resources :beers

  get '/beers/menu/serve-breja', to: "beers#serve_breja"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
