require 'pg'
require 'Date'
require './lib/user'

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
    # Added for date instance checking possibly obsolete, will review.
  end

  def self.add(peep, tag)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_db_test')
    else
      connection = PG.connect(dbname: 'chitter_db')
    end
    act_user = User.last.last[:username.to_sym]
    connection.exec("INSERT INTO messages (peep, tag) VALUES ('Posted By #{act_user} : #{peep}', '#{tag}');")
    #{:last_user}:
  end

end
