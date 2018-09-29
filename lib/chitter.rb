require 'pg'

class Message
  def self.show
    connection = PG.connect(dbname: 'chitter_db_test')
    messages = connection.exec('SELECT * FROM posts')
    messages.map { |post| post['message'] }

  end

  # def self.add
  # end
end
