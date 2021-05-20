require 'pg'

class Message
  def self.all 
    conn = if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test', user: 'charlieslater')
    else
      PG.connect(dbname: 'chitter', user: 'charlieslater')
    end

    rows = conn.exec('SELECT * FROM messages')
    rows.map { |bookmark| bookmark }
  end

  def self.post(message)
    conn = if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test', user: 'charlieslater')
    else
      PG.connect(dbname: 'chitter', user: 'charlieslater')
    end

  conn.exec("INSERT INTO messages (content, date_posted) VALUES('#{message}', NOW())")  
  end
end