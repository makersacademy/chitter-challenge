require_relative 'database_connection'

class Chit
  attr_reader :id, :text

  def initialize(id:, text:)
    @id = id
    @text = text
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM chits")
    result.map do |chit|
      Chit.new(id: chit['id'], text: chit['text'])
    end
  end

  def self.create(text:)
    result = DatabaseConnection.query(
      "INSERT INTO chits (text) VALUES($1) RETURNING id, text, time;", [text]
      )
    Chit.new(id: result[0]['id'], text: result[0]['text'])
  end
end