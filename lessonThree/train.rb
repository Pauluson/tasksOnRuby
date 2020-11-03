# frozen_string_literal: true

require './station.rb'

class Train
  attr_reader :number
  attr_reader :type
  attr_reader :route
  attr_accessor :current_station
  attr_accessor :speed
  attr_accessor :count

  def initialize(number, type, count)
    @number = number
    @type = type
    @count = count
    @speed = 0
  end

  def raise_speed(speed)
    @speed += @speed
    puts "Train speed: #{speed}"
  end

  def stop
    @speed = 0
  end

  def add_carriage
    if speed.zero?
      @count += 1
    else
      puts 'Stop before add carriage'
    end
  end

  def delete_carriage
    if speed.zero?
      @count -= 1
    else
      puts 'Stop before delete carriage'
    end
  end

  def route=(route)
    @route = route
    @current_station = route.stations.first
    # current_station.get_train(number)
  end

  def next_station
    route.stations[route.stations.index(@current_station) + 1]
  end

  def previous_station
    route.stations[route.stations.index(@current_station) - 1]
  end

  def move_next_station
    @current_station = route.stations[route.stations.index(@current_station) + 1]
  end

  def move_previous_station
    @current_station = route.stations[route.stations.index(@current_station) - 1]
  end
end
