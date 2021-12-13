require_relative 'database_connection'

class Peep
attr_reader :id, :text, :time

  def initialize(id:, text:, time:)
    @id = id
    @text = text
    @time = time
  end

  def self.create(text:)
    result = DatabaseConnection.query("INSERT INTO peeps (text) VALUES ($1) RETURNING id, text, time", [text])
    Peep.new(id: result[0]['id'], text: result[0]['text'], time: result[0]['time'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(id: peep['id'], text: peep['text'], time: peep['time'])}.reverse
  end
end