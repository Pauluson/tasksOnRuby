# frozen_string_literal: true

class PassengerTrain < Train
  attr_reader :carriages
  attr_reader :type
  attr_reader :type_of_carriage
  def initialize(number_of_train)
    @type = 'Passenger'
    super
  end
end
