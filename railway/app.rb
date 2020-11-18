# frozen_string_literal: true

require 'pry'
require './station.rb'
require './route.rb'
require './train.rb'
require './cargoTrain.rb'
require './passengerTrain.rb'
require './cargoCarriage.rb'
require './passengerCarriage.rb'
require './carriage'

stations = []
routes = []
trains = []
class Menu
  attr_accessor :stations
  attr_accessor :routes
  attr_accessor :trains
  def initialize
    @stations = []
    @routes = []
    @trains = []
  end

  def main_menu
    puts 'Welcome to railway!'
    puts '1.Create station'
    puts '2.Create train'
    puts '3.Create route'
    puts '4.Carriages'
    puts '5.Add route to train'
    puts '6.Fixed route'
    puts '7.Move trains'
    puts '0.Exit'
  end

  def create_station
    puts 'Enter the station:'
    station_name = gets.chomp.to_s
    station = Station.new(station_name)
    stations << station
    puts "Your create station:#{station.name}"
  end

  def create_train
    puts 'Choose type of train:'
    puts '1.Passenger'
    puts '2.Carrige'
    type = gets.chomp.to_i
    puts 'Input number of train:'
    number_of_train = gets.chomp.to_i
    if type == 1
      train = PassengerTrain.new(number_of_train)
      trains << train
    elsif type == 2
      train = CargoTrain.new(number_of_train)
      trains << train
    end
  end

  def create_route
    puts 'Choose the station:'
    show_stations
    puts 'Input first station of route:'
    first_station = gets.chomp.to_i
    puts 'Input finish station of route:'
    finish_station = gets.chomp.to_i
    route = Route.new(stations[first_station - 1], stations[finish_station - 1])
    routes << route
  end

  def carriges
    puts '1.Add carriage'
    puts '2.Delete carriage'
    choice = gets.chomp.to_i
    if choice == 1
      puts 'On what train do you want to add carriage?'
      show_trains
      number_of_train = gets.chomp.to_i
      trains.each_with_index do |train, index|
        if (number_of_train - 1 == index) && (train.type == 'Cargo')
          cargo_carriage = CargoCarriage.new
          train.add_carriage(cargo_carriage)
        elsif (number_of_train - 1 == index) && (train.type == 'Passenger')
          passenger_carriage = PassengerCarriage.new
          train.add_carriage(passenger_carriage)
        end
      end
    elsif choice == 2
      puts 'On what train do you want to delete carriage?'
      show_trains
      number_of_train = gets.chomp.to_i
      trains.each_with_index do |train, index|
        next unless number_of_train - 1 == index

        train.carriages.each do |carriage|
          train.delete_carriage(carriage)
        end
      end
    end
  end

  def add_route
    puts 'Enter the train to add route:'
    show_trains
    number_of_train = gets.chomp.to_i
    puts 'Choice route:'
    show_routes
    number_of_route = gets.chomp.to_i
    trains.each_with_index do |train, index|
      next unless number_of_train - 1 == index

      routes.each_with_index do |value, index|
        train.route = value if number_of_route - 1 == index
      end
    end
  end

  def fixed_route
    puts 'Choose the route to fixed:'
    show_routes
    number_of_route = gets.chomp.to_i
    puts '1.Add station'
    puts '2.Delete station'
    number_of_choice = gets.chomp.to_i
    if number_of_choice == 1
      puts 'Choose the station:'
      show_stations
      number_of_station = gets.chomp.to_i
      stations.each_with_index do |station, index|
        next unless number_of_station - 1 == index

        routes.each_with_index do |route, index|
          route.add_station(station) if number_of_route - 1 == index
        end
      end
    elsif number_of_choice == 2
      puts 'Input station to delete'
      station_to_delete = gets.chomp.to_s
      routes.each_with_index do |route, index|
        next unless number_of_route - 1 == index

        route.stations.each do |station|
          route.delete_station(station) if station_to_delete == station.name
        end
      end
    end
  end

  def move_trains
    stations.each do |station|
      puts "Station:#{station.name}, Train:#{station.all_trains}"
    end
    puts 'Choose the number of train:'
    show_trains
    number_of_train = gets.chomp.to_i
    puts '1.Move next station'
    puts '2.Move previous station'
    choice = gets.chomp.to_i
    if choice == 1
      trains.each_with_index do |train, index|
        train.move_next_station if number_of_train - 1 == index
      end
    elsif choice == 2
      trains.each do |train|
        train.move_previous_station if number_of_train - 1 == index
      end
    end
  end

  def information
    p stations
    p routes
    p trains
  end

  private

  def show_stations
    stations.each_with_index do |station, index|
      puts "#{index + 1}.#{station.name}"
    end
  end

  def show_routes
    routes.each_with_index do |route, index|
      puts "#{index + 1}.#{route}"
    end
  end

  def show_trains
    trains.each_with_index do |train, index|
      puts "#{index + 1}.#{train.number_of_train},#{train.type}"
    end
  end
end
app = Menu.new
loop do
  app.main_menu
  choice = gets.chomp.to_i
  case choice
  when 1
    app.create_station
  when 2
    app.create_train
  when 3
    app.create_route
  when 4
    app.carriges
  when 5
    app.add_route
  when 6
    app.fixed_route
  when 7
    app.move_trains
  when 8
    app.information
  end
  break if choice.zero?
end
