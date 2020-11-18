# frozen_string_literal: true

require './carriage.rb'

class CargoCarriage < Carriage
  def initialize
    @type_of_carriage = 'Cargo'
  end
end
