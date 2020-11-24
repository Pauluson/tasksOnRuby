# frozen_string_literal: true

module Company
  attr_accessor :name_of_company
  def name_of(name_of_company)
    @name_of_company = name_of_company
  end

  def get_name
    puts name_of_company
  end
end
