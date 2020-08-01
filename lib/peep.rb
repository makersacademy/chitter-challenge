require_relative 'database_connection'

class Peep

  def initialize(text)
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |peep| peep['text'] }
  end

  def self.create(text)
    result_ts = DatabaseConnection.query("SELECT date_trunc('minute' , now()) RETURNING *;")
    timestamp = result_ts[0]['timestamp']
    DatabaseConnection.query("INSERT INTO peeps (text, timestamp) VALUES ('#{text}'), ('#{timestamp}');")
    Peep.new(text)
  end
end
