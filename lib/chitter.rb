require 'pg'

class Message
  def self.show
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_db_test')
    else
      connection = PG.connect(dbname: 'chitter_db')
    end

    messages = connection.exec('SELECT * FROM posts')
    messages.map { |post| post['message'] }

  end

  def self.add(message)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_db_test')
    else
      connection = PG.connect(dbname: 'chitter_db')
    end

    connection.exec("INSERT INTO posts (message) VALUES ('#{message}')")
  end
end
