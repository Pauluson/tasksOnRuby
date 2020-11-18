# frozen_string_literal: true

require './station.rb'
require './route.rb'
require './train.rb'
require './cargoTrain.rb'
require './passengerTrain.rb'
require './cargoCarriage.rb'
require './passengerCarriage.rb'

stations = {}
routes = {}
trains = []
loop do
  puts 'Welcome to railway!'
  puts '1.Create station'
  puts '2.Create train'
  puts '3.Create route'
  puts '4.Add carriage to train'
  puts '5.Delete carriage on train'
  puts '6.Add route to train'
  puts '7.Fixed route'
  puts '8.Move trains'
  puts '0.Exit'
  choice = gets.chomp.to_i
  case choice
  when 1
    puts 'Enter the station:'
    station_name = gets.chomp.to_s
    station = Station.new(station_name)
    puts 'Enter number of station:'
    number_of_station = gets.chomp.to_i
    stations[number_of_station] = station
    puts "Your create station:#{station.name}"
  when 2
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
  when 3
    puts 'Choose the station:'
    stations.each do |key, station|
      puts "#{key}.#{station.name}"
    end
    puts 'Input first station of route:'
    first_station = gets.chomp.to_i
    puts 'Input finish station of route:'
    finish_station = gets.chomp.to_i
    route = Route.new(stations[first_station], stations[finish_station])
    puts 'Input number of route:'
    number_of_route = gets.chomp.to_i
    routes[number_of_route] = route
  when 4
    puts 'On what train do you want to add carriage?'
    trains.each do |train|
      puts "#{train.number_of_train},#{train.type}"
    end
    number_of_train = gets.chomp.to_i
    trains.each do |train|
      if (number_of_train == train.number_of_train) && (train.type == 'Cargo')
        puts 'Enter number_of_carriage:'
        number_of_carriage = gets.chomp.to_i
        cargo_carriage = CargoCarriage.new(number_of_carriage)
        train.add_carriage(cargo_carriage)
      elsif (number_of_train == train.number_of_train) && (train.type == 'Passenger')
        puts 'Enter number_of_carriage:'
        number_of_carriage = gets.chomp.to_i
        passenger_carriage = PassengerCarriage.new(number_of_carriage)
        train.add_carriage(passenger_carriage)
      end
    end
  when 5
    puts 'On what train do you want to delete carriage?'
    trains.each do |train|
      puts "#{train.number_of_train},#{train.type},#{train.carriages}"
    end
    number_of_train = gets.chomp.to_i
    puts 'Input number of carriage:'
    number_of_carriage = gets.chomp.to_i
    trains.each do |train|
      next unless number_of_train == train.number_of_train

      train.carriages.each do |carriage|
        train.delete_carriage(carriage) if number_of_carriage == carriage.number
      end
    end
  when 6
    puts 'Enter the train to add route:'
    trains.each do |train|
      puts "#{train.number_of_train},#{train.type}"
    end
    number_of_train = gets.chomp.to_i

    puts 'Choice route:'
    routes.each { |key, route| puts "#{key}.#{route}" }
    number_of_route = gets.chomp.to_i

    trains.each do |train|
      next unless number_of_train == train.number_of_train

      routes.each do |key, value|
        train.route = value if number_of_route == key
      end
    end
  when 7
    puts 'Choose the route to fixed:'
    routes.each { |key, route| puts "#{key}.#{route}" }
    number_of_route = gets.chomp.to_i
    puts '1.Add station'
    puts '2.Delete station'
    number_of_choice = gets.chomp.to_i
    if number_of_choice == 1
      puts 'Choose the station:'
      stations.each do |key, station|
        puts "#{key}.#{station.name}"
      end
      number_of_station = gets.chomp.to_i
      stations.each do |key, station|
        next unless number_of_station == key

        routes.each do |key, route|
          if number_of_route = key
            route.add_station(station)
          end
        end
      end
    elsif number_of_choice == 2
      puts 'Input station to delete'
      station_to_delete = gets.chomp.to_s
      routes.each do |key, route|
        next unless number_of_route == key

        route.stations.each do |station|
          route.delete_station(station) if station_to_delete == station.name
        end
      end
    end
  when 8
    stations.each do |_key, station|
      puts "Station:#{station.name}, Train:#{station.all_trains}"
    end
    puts 'Choose the number of train:'
    trains.each do |train|
      puts "#{train.number_of_train},#{train.type}"
    end
    number_of_train = gets.chomp.to_i
    puts '1.Move next station'
    puts '2.Move previous station'
    choice = gets.chomp.to_i
    if choice == 1
      trains.each do |train|
        train.move_next_station if number_of_train == train.number_of_train
      end
    elsif choice == 2
      trains.each do |train|
        train.move_previous_station if number_of_train == train.number_of_train
      end
    end

  when 9
    p stations
    p routes
    p trains
  end
  break if choice.zero?
end
