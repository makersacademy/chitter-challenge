require 'pg'

class Message

  def self.create(text:)
    if ENV['ENVIRONMENT'] == 'test' 
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec("INSERT INTO message (text) VALUES ('#{text}') RETURNING id, text, time")

  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM message ORDER BY time DESC")

    result.map { |message| message['text'] }

  end

end
