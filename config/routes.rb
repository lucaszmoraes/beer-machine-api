Rails.application.routes.draw do
  # Beers Routes
  resources :beers

  # Beer Menu Routes
  get '/beers/menu/serve-breja', to: "beers_menu#serve_breja"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
