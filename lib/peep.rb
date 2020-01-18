require_relative 'database_connection'

class Peep

  attr_reader :id, :text, :timestamp

  def initialize(id:, text:, timestamp:)
    @id = id
    @text = text
    @timestamp = timestamp
  end

  def self.all
    DatabaseConnection.setup(environment)
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(id: peep['id'], text: peep['text'], timestamp: peep['timestamp']) }
  end

  def self.create(text:, timestamp: Time.now.strftime("%Y-%m-%d %H:%M"))
    DatabaseConnection.setup(environment)
    DatabaseConnection.query("INSERT INTO peeps (text, timestamp) VALUES ('#{text}', '#{timestamp}') RETURNING id, text, timestamp")
  end

  def self.environment
    ENV['RACK_ENV'] == 'test' ? 'chitter_app_test' : 'chitter_app'
  end

end
