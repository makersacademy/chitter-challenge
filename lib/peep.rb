require_relative 'database_connection'

class Peep
  attr_reader :id, :text

  def initialize(id:, text:)
    @id = id
    @text = text
  end

  def self.create(text:)
    result = DatabaseConnection.query("INSERT INTO peeps (text)
     VALUES ('#{text}') RETURNING id, text;")
    Peep.new(id: result[0]['id'], text: result[0]['text'])
  end

  def self.all
    peeps = DatabaseConnection.query('SELECT * FROM peeps')
    peeps.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'])
    end
  end

end
