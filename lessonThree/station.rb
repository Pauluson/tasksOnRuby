# frozen_string_literal: true

class Station
  attr_reader :name
  attr_reader :trains
  def initialize(name)
    @name = name
    @trains = []
  end

  def get_train(train)
    trains << train
  end

  def send_train(_train)
    trains.delete(trains)
  end

  def train_by_type(type)
    trains.each do |train|
      puts train.number if train.type == type
    end
  end

  def all_trains
    trains.each do |train|
      puts train.number
    end
  end
end
