class BeersMenuController < ApplicationController

  def serve_breja
    @breja = BeersMenuService.new(1).serve
    @breja_escolhida = Beer.find(@breja)
    render json: @breja_escolhida
  end 

end