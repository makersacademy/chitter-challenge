# Peep class, takes care of all peeps
require 'date'

class Peep
  attr_reader :peep_id, :user_id, :peep, :time
  def initialize(peep_id, user_id, peep, time)
    @peep_id = peep_id
    @user_id = user_id
    @peep = peep
    @time = time
  end

  def self.show_all
#  adding test peep objects and returning the array
    p1 = Peep.new(1, 1, 'This is first peep', '21:00')
    p2 = Peep.new(2, 1, 'This is second peep', '22:25')
    p3 = Peep.new(3, 2, 'This is third peep', '23:22')
    p4 = Peep.new(4, 1, 'This is fourth peep', '00:10')

    peeps = [p1, p2, p3, p4]
    return peeps

  end

end
