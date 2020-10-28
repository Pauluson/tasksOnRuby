
class Station
	attr_reader :name
	def initialize(name)
		@name = name
		@trains = []
	end
	def get_train(train)
		self.trains << train
	def send_train(train)
		self.trains.delete(trains)
	end
	def train_by_type(type)
		self.trains.each do |train|
			if train.type == type
				puts  train
			end
		end
	end
end