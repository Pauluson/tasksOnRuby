# frozen_string_literal: true

require './carriage.rb'

class PassengerCarriage < Carriage
  def initialize
    @type_of_carriage = 'Pessenger'
  end
end
