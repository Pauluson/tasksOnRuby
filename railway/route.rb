# frozen_string_literal: true

class Route
  attr_reader :stations
  def initialize(start_station, finish_station)
    @stations = []
    @stations << start_station
    @stations << finish_station
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def get_all_stations
    stations.each do |station|
      puts station.name
    end
  end
end
