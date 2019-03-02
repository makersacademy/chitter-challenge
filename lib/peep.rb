require './connect_to_database'

class Peep
  attr_reader :text, :created_at

  def initialize(text:, created_at:)
    @text = text
    @created_at = created_at
  end

  def self.all
    result = DatabaseConnection.query('select * from peeps order by created_at desc')
    result.map { |peep| Peep.new(text: peep['text'], created_at: peep['created_at']) }
  end

  def self.create(text:)
    
    result = DatabaseConnection.query("insert into peeps (text) values ('#{text}') returning id, text, created_at;")
    Peep.new(text: result[0]['text'], created_at: DateTime.parse(result[0]['created_at']))
  end
  
end
