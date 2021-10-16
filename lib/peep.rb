# frozen_string_literal: true

class Peep
  attr_reader :peep, :time

  def initialize(peep, time)
    @peep = peep
    @time = time
  end

  def timestamp
    DateTime.parse(@time).strftime('%c')
  end
end
