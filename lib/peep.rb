require 'pg'

class Peep
  attr_reader :id, :text, :posted
  def initialize(id:, text:, posted:)
    @id = id
    @text = text
    @posted = posted
  end

  def self.all
    dbname = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'chitter'
    connection = PG.connect(dbname: dbname)
    response = connection.exec('SELECT * FROM peeps;')
    response.map { |peep| Peep.new(id: peep['id'], text: peep['text'], posted: peep['posted']) }
  end

  def self.create(text:, posted:)
    dbname = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'chitter'
    connection = PG.connect(dbname: dbname)
    response = connection.exec("INSERT INTO peeps (text, posted) VALUES ('#{text}', '#{posted}') RETURNING id, text, posted;")
    Peep.new(id: response[0]['id'], text: response[0]['text'], posted: response[0]['posted'])
  end
end