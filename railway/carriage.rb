# frozen_string_literal: true

require './company.rb'
class Carriage
  attr_reader :type_of_carriage
  def initialize; end
  include Company
end
