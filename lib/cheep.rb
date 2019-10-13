require 'pg'

class Cheep
  attr_reader :id, :text, :time

  def initialize(id, text, time)
    @id = id
    @text = text
    @time = time
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM cheeps')
    result.map { |cheep| Cheep.new(cheep['id'],cheep['text'], cheep['time'])}
  end

  def self.create(text:)
      cheep = DatabaseConnection.query("INSERT INTO cheeps (text) VALUES ('#{text}')RETURNING id, text, time;").first
      Cheep.new(cheep['id'], cheep['text'], cheep['time'])
    end

end
