require "pg"

class Peep

  def self.all
    messages = connect_to_db.exec("SELECT * FROM messages;")
    messages.map { |post| post['message'] }
  end

  def self.create(message:)
    connect_to_db.exec("INSERT INTO messages (message) VALUES ('#{message}');")
  end

  def self.connect_to_db
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'message_manager_test')
    else
      connection = PG.connect(dbname: 'message_manager')
    end
  end
end