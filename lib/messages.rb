require 'pg'
require 'date'

class Messages

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_test')
    else
      connection = PG.connect(dbname: 'Chitter')
    end
    result = connection.exec("SELECT * FROM messages;")
    result.map { |message| message['messages'] }
  end

  def self.create(messages:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'Chitter_test')
    else
      connection = PG.connect(dbname: 'Chitter')
    end
      connection.exec("INSERT INTO messages (messages) VALUES('#{messages}')")
  end

end
