require 'pg'

class Message
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    connection = PG.connect(dbname: 'chitter_manager')
    result = connection.exec("SELECT * FROM messages;")
    result.map { |messages| messages['message'] }
  end

  def self.post(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    connection.exec("INSERT INTO messages (message) VALUES ('#{:message}');")
  end
end
