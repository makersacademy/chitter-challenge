require_relative 'database_connection'

class Peep
  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_at desc")
    result.map do |peep|
      Peep.new(
        id: peep['id'], 
        text: peep['text'],
        created_at: peep['created_at'])    
    end
  end

  def self.create(text:)
    result = DatabaseConnection.query("INSERT INTO peeps(text) VALUES('#{text}') RETURNING id, text, created_at;")
    Peep.new(id: result[0]['id'], text: result[0]['text'], created_at: result[0]['created_at'])
  end

  attr_reader :id, :text, :created_at

  def initialize(id:, text:, created_at:)
    @id = id
    @text = text
    @created_at = created_at
  end
end
