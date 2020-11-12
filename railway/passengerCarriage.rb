# frozen_string_literal: true

class PassengerCarriage
  attr_reader :nubmer
  attr_reader :type_of_carriage
  def initialize(number)
    @number = number
    @type_of_carriage = 'Pessenger'
  end
end
