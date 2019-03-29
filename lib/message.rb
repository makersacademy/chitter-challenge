require 'pg'

class Message
  def self.all
    connection = PG.connect(dbname: 'chitter_manager')
    result = connection.exec("SELECT * FROM messages;")
    result.map { |messages| messages['message'] }
  end
end
