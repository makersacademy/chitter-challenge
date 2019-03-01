require 'pg'

class Peep
  attr_reader :text

  def initialize(text:)
    @text = text
  end

  def self.all
    result = DatabaseConnection.query('select * from peeps')
    result.map { |peep| Peep.new(text: peep['text']) }
  end

  def self.create(text:)
    
    result = DatabaseConnection.query("insert into peeps (text) values ('#{text}') returning id, text, created_at;")
    Peep.new(text: result[0]['text'])
  end
  
end
