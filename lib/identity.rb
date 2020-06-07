# frozen_string_literal: true

class Identity
  attr_reader :name, :password
  def initialize(name, password)
    @name = name
    @password = password
  end
end
