require_relative './database_connection'

class Peep 

  attr_reader :id, :message, :time

  def initialize(id:,message:,time:)
    @id = id 
    @message = message
    @time = time
  end 

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |row|
      Peep.new(id: row['id'],message: row['peep'], time: row['time'])
    end 
  end

  def self.add(message)
    time = Time.now.strftime("%d/%m/%Y %k:%M")
    result = DatabaseConnection.query("INSERT INTO peeps (peep,time) VALUES ('#{message}','#{time}') RETURNING id, peep, time;")
    Peep.new(id: result[0]['id'], message: result[0]['peep'], time: result[0]['time'])
  end 

end 