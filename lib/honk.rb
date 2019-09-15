require 'pg'

class Honk

  attr_reader :id, :text
  
  def self.all
    result = DatabaseConnection.query("SELECT * FROM honks;")
    result.map do |honk| 
      Honk.new(id: honk['id'], text: honk['text'])
    end 
  end

  def self.add(text:)
    result = DatabaseConnection.query("INSERT INTO honks (text) VALUES ('#{text}') RETURNING id, text;")
    Honk.new(id: result[0]['id'], text: result[0]['text'])
  end

  def initialize(id:, text:)
    @id = id
    @text = text
  end
end
