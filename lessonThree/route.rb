class Route
	attr_reader :stations
	  def initialize(start_station, finish_station)
    @stations = []
    @stations << start_station
    @stations << finish_station
  end

  def delete_station(station)
  	@stations.delete(station)
  	 def add_station(station)
    @stations.insert(0, station)
  end
end