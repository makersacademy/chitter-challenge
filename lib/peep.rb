require_relative 'database_connection'
require 'pg'

class Peep
  def self.all
    [
      "hi, what's up?", "bored at home"
     ]
  end
end
