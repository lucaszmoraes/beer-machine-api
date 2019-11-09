class Api::V1::BeersMenuController < Api::V1::ApiController

  # Service que recebe a temperatura do endpoint
  # e calcula a melhor cerveja e a retorna com JSON
  def best_beer_by_temperature
    given_temperature =  beer_by_temperature_params[:temperature].to_i
    @best_beer = BeersMenuService.new(given_temperature).calculates_best_beer_by_temperature
    #@choosen_beer = Beer.find(@best_beer_id)
    #byebug
    #@choosen_beer = @best_beer_id.to_json   
    render json: @best_beer.to_json
  end

  private
    def beer_by_temperature_params
      params.require(:beer).permit(:temperature)
    end

end