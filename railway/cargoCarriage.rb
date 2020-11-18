# frozen_string_literal: true

class CargoCarriage
  attr_reader :number
  attr_reader :type_of_carriage
  def initialize(number)
    @number = number
    @type_of_carriage = 'Cargo'
  end
end
