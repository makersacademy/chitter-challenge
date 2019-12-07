require 'pg'

class Peep

  attr_reader :id, :message, :created

  def initialize(id:, message:, created:)
    @id = id
    @message = message
    @created = created
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end
    result = connection.exec("SELECT * FROM messages ORDER BY id DESC;")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['text'], created: peep['created'])
    end
  end

  def self.create(message)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end
    result = connection.exec("INSERT INTO messages(text) VALUES('#{message}') RETURNING id, text, created;")
    Peep.new(id: result[0]['id'], message: result[0]['text'], created: result[0]['created'])
  end

end
