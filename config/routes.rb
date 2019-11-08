Rails.application.routes.draw do

  # Routes de Beers
  namespace :api do
    namespace :v1 do
      resources :beers

      # Routes de Beers Menu
      post  '/beers/menu/melhor-cerveja', to: "beers_menu#best_beer_by_temperature"
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
