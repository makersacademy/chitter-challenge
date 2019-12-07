require 'pg'

class Peep

  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end
    result = connection.exec("SELECT * FROM messages;")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['text'])
    end
  end

  def self.create(message)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end
    result = connection.exec("INSERT INTO messages(text) VALUES('#{message}') RETURNING id, text;")
    Peep.new(id: result[0]['id'], message: result[0]['text'])
  end

end