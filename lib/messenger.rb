require 'pg'

class Messenger
  attr_reader :message

  def self.create(message)
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO messages (text) VALUES('#{message}')")
  end
end
