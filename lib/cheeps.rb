require 'pg'
require_relative 'database_connection'

class Cheeps

  attr_reader :id, :cheep, :time

  def initialize(id:, cheep:, time: Time.now)
    @id = id
    @cheep = cheep
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM cheeps")
    result.map { |cheep| Cheeps.new(id: cheep['id'], cheep: cheep['cheep'], time: cheep['time']) }
  end
  
  def self.create(cheep:, time: Time.now)
    result = DatabaseConnection.query("INSERT INTO cheeps (cheep, time) VALUES('#{cheep}', '#{time}') RETURNING id, cheep, time;")
    Cheeps.new(id: result[0]['id'], cheep: result[0]['cheep'], time: result[0]['time'])
  end

  def self.reverse
    Cheeps.all.reverse
  end
end
