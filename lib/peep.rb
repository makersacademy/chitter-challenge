require 'pg'

class Peep

  attr_reader :id, :message

  def initialize(id = nil, message = "no message entered")
    @id = id
    @message = message
  end

  def self.all_peeps
    database_connection
    result = @connection.exec("SELECT * FROM peeps")
    result.map do |row|
      Peep.new(row["id"], row["message"])
    end
  end

  def self.create(message = "no message entered")
    database_connection
    result = @connection.exec_params("INSERT INTO peeps (message) VALUES ($1) RETURNING id, message;", [message])
    Peep.new(result[0]["id"], result[0]["message"])
  end

  def self.newest_peeps
    Peep.all_peeps.reverse
  end
 
private

  def self.database_connection
    if ENV['RACK_ENV'] == "test"
      @connection = PG.connect(dbname: "chitter_test")
    else
      @connection = PG.connect(dbname: "chitter")
    end
  end

end
