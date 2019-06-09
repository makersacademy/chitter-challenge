require require './db/database'

class Peep 
  attr_reader :body
  
  def initialize()
    @body = nil
  end

  def self.all 
    Database.setup
    result = Database.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new
    end
  end

  def self.add(peep)

  end
end