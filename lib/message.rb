require 'pg'

class Message
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    result = connection.exec("SELECT * FROM messages;")
    result.map { |messages| "@#{messages['username']}: #{messages['message']}" }.reverse
  end

  def self.post(username:, message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_manager_test')
    else
      connection = PG.connect(dbname: 'chitter_manager')
    end

    connection.exec("INSERT INTO messages (username, message) VALUES ('#{username}', '#{message}');")
  end
end
