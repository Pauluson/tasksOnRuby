# frozen_string_literal: true

class PassengerTrain < Train
  attr_reader :carriages
  attr_reader :type
  attr_reader :type_of_carriage
  def initialize(number_of_train)
    @type = 'Passenger'
    super
  end
  #   def add_carriage(carriage)
  #     if carriage.type_of_carriage == 'Passenger'
  #       carriages << carriage
  #     else
  #       puts 'Wrong type of carriage'
  #     end
  #   end
  #
  #   def delete_carriage(carriage)
  #     carriages.delete(carriage)
  #   end
end
