require_relative 'database_connection'

class Chitter
  
  attr_reader :id, :message, :time

  def initialize(id:, message:, time:) 
    @id = id
    @message = message
    @time = time
  end


  def self.peep_history
    result = DatabaseConnection.query("SELECT * FROM chitter ORDER BY time;")
    result.map do |peep|
      Chitter.new(id: peep['id'], message: peep['message'], time: peep['time'])
    end
  end






  def self.create(message:)
    result = DatabaseConnection.query(
      "INSERT INTO chitter (message) VALUES('#{message}') RETURNING message;"
    )
    Chitter.new(id: result[0]['id'], message: result[0]['message'], time: result[0]['time'])
  end 

end
