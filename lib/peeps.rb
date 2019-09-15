require_relative 'database_connection'

class Peeps

  attr_reader :id, :text

  def initialize(id:, text:)
    @id = id
    @text = text
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
    Peeps.new(id: peep['id'], text: peep['text'])
    end
  end

  def self.post(text)
    result = DatabaseConnection.query("INSERT INTO peeps (text) VALUES ('#{text}') RETURNING id, text")
    Peeps.new(id: result[0]['id'], text: result[0]['text'])
  end

end