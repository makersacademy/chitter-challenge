require 'pg'

class Peep
  def self.all
    begin
      connection = PG.connect :dbname => 'chitter_test'
      result = connection.exec("SELECT * FROM peeps;")
      result.map do |row|
        row
        new(id: row["id"],
            message: row["message"],
            timestamp: row["timestamp"])
      end
    rescue PG::Error => e
      puts e.message
    ensure
      connection.close if connection
    end
  end

  def self.create(message:, timestamp:)
    begin
      connection = PG.connect :dbname => 'chitter_test'
      connection.exec("INSERT INTO peeps (message, timestamp) VALUES('#{message}', '#{timestamp}')")
    rescue PG::Error => e
      puts e.message
    ensure
      connection.close if connection
    end
  end

  attr_reader :id, :message, :timestamp
  def initialize(id:, message:, timestamp:)
    @id = id
    @message = message
    @timestamp = timestamp
  end
end

