require_relative 'database_connection'

class Peep

  attr_reader :id, :text

  def initialize(id:, text:)
    @id = id
    @text = text
  end

  def self.all
    DatabaseConnection.setup(environment)
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(id: peep['id'], text: peep['text']) }
  end

  def self.create(text:)
    DatabaseConnection.setup(environment)
    DatabaseConnection.query("INSERT INTO peeps (text) VALUES ('#{text}') RETURNING id, text")
  end

  def self.environment
    ENV['RACK_ENV'] == 'test' ? 'chitter_app_test' : 'chitter_app'
  end

end
