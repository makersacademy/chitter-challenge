require_relative './database_connection'

class Peep 

  attr_reader :id, :message

  def initialize(id:,message:)
    @id = id 
    @message = message
  end 

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |row|
      Peep.new(id: row['id'],message: row['peep'])
    end 
  end

  def self.add(message)
    result = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES ('#{message}') RETURNING id, peep;")
    Peep.new(id: result[0]['id'], message: result[0]['peep'])
  end 
end 