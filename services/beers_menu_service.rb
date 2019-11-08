class BeersMenuService
  attr_reader :given_temperature

  def initialize(given_temperature)
    @given_temperature = given_temperature
  end

  def calculates_best_beer_by_temperature
    @beers.each do |beer|
      beer_style = beer.style
      avg_temp = (beer.min_consumption_temperature.to_f + beer.max_consumption_temperature.to_f)/2
      @hash[beer_style] = avg_temp
    end

    @hash["0"] = given_temperature.to_f
    newhash = Hash[ @hash.sort_by { |key, val| [val, key] } ]
    newhash.each_with_index do |beer, index|
      if beer[0] == "0"
        @position = index
      end
    end

    if newhash.keys[@position - 1].present? && newhash.keys[@position + 1].present?
      antecessor  = newhash.values[@position - 1] - newhash.values[@position]
      sucessor    = newhash.values[@position + 1] - newhash.values[@position]
      if antecessor.abs < sucessor.abs
        best_beer = newhash.keys[@position - 1]
      elsif antecessor.abs > sucessor.abs
        best_beer = newhash.keys[@position + 1]
      else
      end 
    else
      best_beer = newhash.keys[@position + 1]
    end

    @best_beer = Beer.find_by_style(best_beer)
    return @best_beer.id
  end

end