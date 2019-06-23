require_relative 'database_connection'

class Peep
  attr_reader :id, :text, :time

  def initialize(id:, text:, time:)
    @id = id
    @text = text
    @time = time
  end

  def self.create(text:)
    result = DatabaseConnection.query("INSERT INTO peeps (text)
     VALUES ('#{text}') RETURNING id, text;")
    Peep.new(id: result[0]['id'], text: result[0]['text'], time: result[0]['created_at'])
  end

  def self.all
    peeps = DatabaseConnection.query('SELECT * FROM peeps ORDER BY created_at DESC')
    peeps.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], time: peep['created_at'])
    end
  end

end
