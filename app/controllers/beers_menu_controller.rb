class BeersMenuController < ApplicationController

  # Service que recebe a temperatura do endpoint
  # calcula a melhor cerveja e a retorna com JSON
  def best_beer_by_temperature
    given_temperature =  beer_by_temperature_params[:temperature].to_i
    @best_beer_id = BeersMenuService.new(given_temperature).calculates_best_beer_by_temperature
    @choosen_beer = Beer.find(@best_beer_id)
    render json: @choosen_beer
  end

  private
    def beer_by_temperature_params
      params.require(:beer).permit(:temperature)
    end

end