require 'pg'
require_relative 'db_connection'

class Peep
  

  attr_reader :id, :peep, :peeper, :date, :peeper_name
  
  def initialize(id:, peep:, peeper:, date:, peeper_name:)
    @id = id
    @peep = peep
    @peeper = peeper
    @date = date
    @peeper_name = peeper_name
  end

  def self.create(peep, time, peeper, peeper_name)    
    result = DbConnection.query("INSERT INTO peeps(peep, peeper, date, name) VALUES('#{peep}', '#{peeper}', '#{time}', '#{peeper_name}') RETURNING id, peep, peeper, date, name;")
    Peep.new(
      id: result[0]['id'], 
      peep: result[0]['peep'], 
      peeper: result[0]['peeper'],
      date: result[0]['date'],
      peeper_name: result[0]['name']
    )
  end

  def self.all
    result = DbConnection.query("SELECT * FROM peeps ORDER BY date DESC")
    result.map do |peep|
      Peep.new(
        id: peep['id'], 
        peep: peep['peep'], 
        peeper: peep['peeper'],
        date: peep['date'],
        peeper_name: peep['name']
      )
    end

  end

end