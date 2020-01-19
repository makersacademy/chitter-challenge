require "database_connection"

class Peep 

  attr_reader :id, :peep

  def initialize(id:,peep:)
    @id = id 
    @peep = peep
  end 

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |row|
      Peep.new(id: row['id'],peep: row['url'])
    end 
  end

  def self.add(message)
    DatabaseConnection.query("INSERT INTO peeps (peep) VALUES '#{message}'")
  end 
end 