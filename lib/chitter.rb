require 'pg'

class Chitter

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_messenger_test')
    else
      connection = PG.connect(dbname: 'chitter_messenger')
    end

    result = connection.exec("SELECT * FROM messages;")
    result.map { |message| message['peep'] }
  end
  
end
