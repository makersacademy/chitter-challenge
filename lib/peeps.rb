require 'pg'
require_relative 'database_connection'

class Peeps  
  def self.all
    ["Peep 1", "Peep 2", "Peep 3"]
  end 
end