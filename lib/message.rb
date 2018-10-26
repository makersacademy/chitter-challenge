require 'pg'
require 'Date'


class Message

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_db_test')
    else
      connection = PG.connect(dbname: 'chitter_db')
    end

    result = connection.exec("SELECT * FROM messages ORDER BY date;")
    @messages = result.map { |message|
      {peep: message['peep'], date: message['date'], tag: message['tag']}
    }
  end

  def date
    Date.new
  end

end
