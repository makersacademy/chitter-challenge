require_relative 'database_connection'

class Peep
  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(
        id: peep['id'], 
        text: peep['text'])    
    end
  end

  def self.create(text:)
    result = DatabaseConnection.query("INSERT INTO peeps(text) VALUES('#{text}') RETURNING id, text;")
    Peep.new(id: result[0]['id'], text: result[0]['text'])
  end

  attr_reader :id, :text

  def initialize(id:, text:)
    @id = id
    @text = text
  end
end
