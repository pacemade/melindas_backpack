require 'pry'

class Backpack
  def initialize(attributes)
    @attributes = attributes # a hash containing day_of_week and weather keys
    @items = []
    prepare
  end

  def items
    @items
  end

  def prepare
    clothes_check
    gym_shoes_day_check
    lunch_day_check
  end

  def clothes_check
    weather = @attributes[:weather]
    # Ensure appropriate clothing is added to backpack
    @items << 'pants'
    @items << 'shirt'
    if weather == 'rainy'
      @items << 'umbrella'
    elsif weather == 'cold'
      @items << 'jacket'
    end
  end

  def gym_shoes_day_check
    day_of_week = @attributes[:day_of_week]
  # Ensure gym shoes are added to backpack if it's a gym day (tuesdays, thursdays)
    if day_of_week == 'tuesday' || day_of_week == 'thursday'
      #add gym shoes to items
      @items << 'gym shoes'
    end
  end

  def lunch_day_check
    day_of_week = @attributes[:day_of_week]
    # Bring a packed lunch on all weekdays
    if day_of_week != 'saturday' && day_of_week != 'sunday'
      @items << 'packed lunch'
    else
      # Bring snacks on weekends
      @items << 'snacks'
    end
  end

  def print_list
    output = []
    output << "Melinda, here's your packing list!"
    output << "Day: #{@attributes[:day_of_week]}, Weather: #{@attributes[:weather]}"
    output << ""

    @items.each do |item|
      output << "- #{item}"
    end
    output.join("\n")
    # binding.pry
  end

end
