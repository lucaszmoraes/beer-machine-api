class BeersMenuService
  attr_reader :given_temperature # necessário pois não há este campo na tabela, ou sequer uma tabela Beers Menu

  # inicializador
  def initialize(given_temperature)
    @given_temperature = given_temperature
  end

  def calculates_best_beer_by_temperature
    @beers = Beer.all
    @hash = {}

    # calcula a média das temperaturas de cada cerveja e a insere como valor na hash
    @beers.each do |beer|
      beer_style = beer.style
      avg_temp = (beer.min_temperature.to_f + beer.max_temperature.to_f)/2
      @hash[beer_style] = avg_temp
    end

    # insere a posição "0" na hash com a temperatura recebida
    @hash["0"] = @given_temperature.to_f

    # busca a posição "0" dentro da hash e salva em @position
    newhash = Hash[ @hash.sort_by { |key, val| [val, key] } ]
    newhash.each_with_index do |beer, index|
      if beer[0] == "0"
        @position = index
      end
    end

    # calculando as distâncias entre as cervejas próximas da posição "0" e retorna a mais próxima
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

    # retorna o ID da melhor cerveja calculada
    @best_beer = best_beer
    return @best_beer
  end

end