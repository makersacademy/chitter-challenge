require 'pg'
require_relative 'database_connection'

class Peep

  attr_reader :peep, :time

  def initialize(peep:, time:)
    @peep = peep
    @time = time
  end

  def self.all
  
    result = DatabaseConnection.query("SELECT peep, to_char(created_at, 'HH24:MI, DD/MM') FROM peeps;")
    result.map do |chitter|
      Peep.new(peep: chitter['peep'], time: chitter['to_char'])
    end
  end

  def self.add(peep)

    result = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES ('#{peep}') 
                              RETURNING id, peep, created_at;")
    Peep.new(peep: result[0]['peep'], time: result[0]['created_at'])
  end

end
