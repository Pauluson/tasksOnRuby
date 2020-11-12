# frozen_string_literal: true

require './station.rb'
require './route.rb'
require './train.rb'
require './cargoTrain.rb'
require './passengerTrain.rb'
require './cargoCarriage.rb'
require './passengerCarriage.rb'

cargoTrain = CargoTrain.new('771')
cargo = CargoCarriage.new(1)
cargo2 = CargoCarriage.new(2)
passcar = PassengerCarriage.new(1)
stationOne = Station.new('Gomel')
stationTwo = Station.new('Minsk')
stationThree = Station.new('Mogilev')

routeOne = Route.new(stationOne, stationTwo)

routeOne.add_station(stationThree)

routeOne.get_all_stations

cargoTrain.route = routeOne

cargoTrain.add_carriage(cargo)
cargoTrain.add_carriage(cargo2)
cargoTrain.add_carriage(passcar)

cargoTrain.delete_carriage(cargo)

cargoTrain.move_next_station

stationThree.all_trains

p cargoTrain

# trainOne = Train.new('771', 'Passenger', 4)
# trainTwo = Train.new('820', 'Carrige', 12)
# stationOne = Station.new('Gomel')
# stationTwo = Station.new('Minsk')
# stationThree = Station.new('Vitebsk')
# stationFour = Station.new('Mogilev')
# routeOne = Route.new(stationOne, stationTwo)
# routeTwo = Route.new(stationTwo, stationFour)
# trainThree = PassengerTrain.new('734', 'Passenger')
#
# p trainThree
# routeOne.add_station(stationThree)
#
# routeTwo.add_station(stationThree)
#
# routeOne.get_all_stations
#
# trainOne.route = routeOne
# trainTwo.route = routeOne
#
# stationTwo.get_train(trainOne)
#
# trainOne.move_next_station
#
# trainOne.move_next_station
#
# p trainOne
#
# stationOne.get_train(trainOne)
#
# p trainOne
#
# p stationOne
#
# p stationThree
#
# p stationTwo
#
# stationOne.get_train(trainOne)
#
# puts "Train #{trainOne.number} on station #{trainOne.current_station.name}"
#
# puts "Next station:#{trainOne.next_station.name}"
#
# trainOne.raise_speed(120)
#
# stationOne.send_train(trainOne)
#
# p stationOne
#
# sleep 1.5
#
# trainOne.move_next_station
#
# trainOne.stop
#
# puts "Train #{trainOne.number} arrived on station #{trainOne.current_station.name}"
#
# stationThree.get_train(trainOne)
#
# trainOne.add_carriage
#
# stationThree.send_train(trainOne)
#
# puts "Next station:#{trainOne.next_station.name}"
#
# sleep 1.5
#
# trainOne.move_next_station
#
# puts "Train #{trainOne.number} arrived on station #{trainOne.current_station.name}"
