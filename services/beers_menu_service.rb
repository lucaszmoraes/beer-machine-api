class BeersMenuService
  attr_reader :beer_id

  def initialize(beer_id)
    @choosen_beer = Beer.find(beer_id)
  end

  def serve
    choosen_beer_id = @choosen_beer.id
    return choosen_beer_id
  end

end