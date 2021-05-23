require_relative './database_connection'

class Peep
  attr_reader :id, :text, :posted
  def initialize(id:, text:, posted:)
    @id = id
    @text = text
    @posted = posted
  end

  def self.all
    response = DatabaseConnection.query('SELECT * FROM peeps;')
    response.map { |peep| Peep.new(id: peep['id'], text: peep['text'], posted: peep['posted']) }
  end

  def self.create(text:, posted:)
    response = DatabaseConnection.query("INSERT INTO peeps (text, posted) VALUES ($1, $2) RETURNING id, text, posted;", [text, posted])
    Peep.new(id: response[0]['id'], text: response[0]['text'], posted: response[0]['posted'])
  end
end