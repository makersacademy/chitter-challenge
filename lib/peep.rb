require 'pg'
require_relative 'db_connection'

class Peep
  

  attr_reader :id, :peep, :peeper, :date
  
  def initialize(id:, peep:, peeper:, date:)
    @id = id
    @peep = peep
    @peeper = peeper
    @date = date
  end

  def self.create(peep, time, peeper)    
    result = DbConnection.query("INSERT INTO peeps(peep, peeper, date) VALUES('#{peep}', '#{peeper}', '#{time}') RETURNING id, peep, peeper, date;")
    Peep.new(
      id: result[0]['id'], 
      peep: result[0]['peep'], 
      peeper: result[0]['peeper'],
      date: result[0]['date']
    )
  end

  def self.all
    result = DbConnection.query("SELECT * FROM peeps ORDER BY date DESC")
    result.map do |peep|
      Peep.new(
        id: peep['id'], 
        peep: peep['peep'], 
        peeper: peep['peeper'],
        date: peep['date']
      )
    end

  end

end