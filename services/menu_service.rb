class MenuService
  attr_reader :beer_id

  def initialize(beer_id)
    #@payment = Payment.find(params[:payment_id])
    @choosen_beer = Beer.find(beer_id)
    #byebug
  end

  def serve
    #return @choosen_beer
    choosen_beer_id = @choosen_beer.id
    return choosen_beer_id
    #render json: @choosen_beer_style
  end

end