require "pg"

class Message

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'message_manager_test')
    else
      connection = PG.connect(dbname: 'message_manager')
    end

    messages = connection.exec("SELECT * FROM messages;")
    messages.map { |post| post['message'] }
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'message_manager_test')
    else
      connection = PG.connect(dbname: 'message_manager')
    end
    connection.exec("INSERT INTO messages (message) VALUES ('#{message}');")
  end
end