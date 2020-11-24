# frozen_string_literal: true

require './station.rb'
require './counter.rb'
require 'pry'
class Train
  attr_reader :number_of_train
  attr_reader :type
  attr_reader :route
  attr_accessor :current_station
  attr_accessor :speed
  attr_accessor :carriages
  include InstanceCounter
  def initialize(number_of_train)
    @carriages = []
    @number_of_train = number_of_train
    @speed = 0
    register_instance
  end

  def raise_speed(speed)
    @speed += @speed
    puts "Train speed: #{speed}"
  end

  def stop
    @speed = 0
  end

  def add_carriage(carriage)
    carriages << carriage
  end

  def delete_carriage(carriage)
    carriages.delete(carriage)
  end

  def route=(route)
    @route = route
    @current_station = route.stations.first
    @current_station.get_train(self)
  end

  def next_station
    route.stations[route.stations.index(@current_station) + 1]
  end

  def previous_station
    route.stations[route.stations.index(@current_station) - 1]
  end

  def move_next_station
    @current_station.send_train(self)
    @current_station = route.stations[route.stations.index(@current_station) + 1]
    @current_station.get_train(self)
  end

  def move_previous_station
    @current_station.send_train(self)
    @current_station = route.stations[route.stations.index(@current_station) - 1]
    @current_station.get_train(self)
  end

  def self.find(number)
    a = false
    ObjectSpace.each_object(Train) do |b|
      b.number_of_train == number ? a = b : a
    end
    p a
  end
end
