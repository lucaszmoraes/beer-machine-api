Rails.application.routes.draw do
  # Beers Routes
  resources :beers

  # Beer Menu Routes
  #get   '/beers/menu/serve-breja', to: "beers_menu#serve_breja"
  post  '/beers/menu/melhor-cerveja', to: "beers_menu#best_beer_by_temperature"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
