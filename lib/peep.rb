require 'pg'
require_relative 'db_connection'

class Peep 
  
  attr_reader :id, :username, :peep, :time_date

  def initialize(id:, username:, peep:, time_date:)
    @id = id
    @username = username
    @peep = peep
    @time_date = time_date
  end

  def self.all 
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep| 
    Peep.new(id: peep['id'], username: peep['username'], peep: peep['peep'], time_date: peep['created_at']) 
    end  
  end

  def time
    time = Time.parse(@time_date.to_s)
    time.strftime("%Y-%m-%d %I:%M %p")
  end

  def self.create(username:, peep:)
    result = DatabaseConnection.query("INSERT INTO peeps (username, peep) VALUES($1, $2) 
    RETURNING id, username, peep, created_at;", [username, peep])
    Peep.new(id: result[0]['id'],
             username: result[0]['username'],
             peep: result[0]['peep'],
             time_date: result[0]['created_at'])
  end
end
