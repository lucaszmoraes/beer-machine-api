class Api::V1::BeersMenuController < Api::V1::ApiController

  # Service que recebe a temperatura do endpoint
  # e calcula a melhor cerveja e a retorna com JSON
  def best_beer_by_temperature
    given_temperature =  beer_by_temperature_params[:temperature].to_i
    @best_beer = BeersMenuService.new(given_temperature).calculates_best_beer_by_temperature
    render json: @best_beer, only: [:style]
  end

  private
    def beer_by_temperature_params
      params.require(:beer).permit(:temperature)
    end

end