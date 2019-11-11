class BeersMenuService
  attr_reader :given_temperature # necessário pois não há este campo na tabela, ou sequer uma tabela Beers Menu

  # inicializador
  def initialize(given_temperature)
    @given_temperature = given_temperature
  end

  def calculates_best_beer_by_temperature
    @beers = Beer.all.order(style: :asc)
    @hash = {}

    # calcula a média das temperaturas de cada cerveja e a insere como valor na hash
    @beers.each do |beer|
      beer_style = beer.style
      avg_temp = (beer.min_temperature.to_f + beer.max_temperature.to_f)/2
      @hash[beer_style] = avg_temp
    end

    # insere a posição "0" na hash com a temperatura recebida
    @hash["0"] = @given_temperature.to_f
    
    @hash_values = []
    @hash.each do |hs|
      @hash_values << hs[1]
    end
    @hash_values = @hash_values.uniq.sort

    newhash = {}
    @hash.each do |hash|
      @hash_values.each do |hash_value|
        if hash[1] == hash_value
          h_key = hash[0]
          h_value = hash[1]
          newhash[h_key] = h_value
        end
      end
    end
    newhash = Hash[ newhash.sort_by { |key, val| [val, key] } ]

    # busca a posição "0" dentro da hash e salva em @position
    #newhash = Hash[ @hash.sort_by { |key, val| [val, key] } ]
    newhash.each_with_index do |beer, index|
      if beer[0] == "0"
        @position = index
      end
    end

    # calculando as distâncias entre as cervejas próximas da posição "0" e retorna a mais próxima
    newhash_size = newhash.size
    if newhash.to_a.first[0] == "0"
      best_beer = newhash.keys[@position + 1]
    elsif newhash.to_a.last[0] == "0"
      best_beer = newhash.keys[@position - 1]
    else
      antecessor  = newhash.values[@position - 1] - newhash.values[@position]
      sucessor    = newhash.values[@position + 1] - newhash.values[@position]
      if antecessor.abs > sucessor.abs
        best_beer_array = []
        newhash.each do |new_hash|
          if new_hash[1] == newhash.values[@position + 1]
            best_beer_array << new_hash[0]
          end
        end
        best_beer_array.shift if best_beer_array[0] == "0"
        best_beer = best_beer_array.first
      elsif antecessor.abs < sucessor.abs
        best_beer_array = []
        newhash.each do |new_hash|
          if new_hash[1] == newhash.values[@position - 1]
            best_beer_array << new_hash[0]
          end
        end
        best_beer_array.shift if best_beer_array[0] == "0"
        best_beer = best_beer_array.first
      else
      end
    end 

    # retorna o ID da melhor cerveja calculada
    @best_beer = Beer.find_by_style(best_beer)
    return @best_beer
  end

end