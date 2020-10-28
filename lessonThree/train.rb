# frozen_string_literal: true

class Train
  attr_reader :number
  attr_reader :type
  attr_reader :route
  attr_accessor :station
  attr_accessor :speed
  attr_accessor :count

  def initialize(number, type, count)
    @number = number
    @type = type
    @count = count
    @speed = 0
  end

  def raise_speed(speed)
    self.speed += speed
  end

  def stop
    @speed = 0
  end

  def add_carriage
    if self.speed.zero?
      self.count += 1
    else
      puts 'Stop before add carriage'
    end
  end

  def delete_carriage
    if self.speed.zero?
      self.count -= 1
    else
      puts 'Stop before delete carriage'
    end
  end

  def route=(route)
    @route = route
    self.station = self.route.stations.first
  end

  def next_station
    route.stations[route.stations.index(station) + 1]
  end

  def previous_station
    route.stations[route.stations.index(station) - 1]
  end

  def move_next_station
    self.station = route.stations[route.stations.index(station) + 1]
  end
end
