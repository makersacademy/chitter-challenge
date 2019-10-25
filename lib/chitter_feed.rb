require 'pg'

class ChitterFeed
  def self.content
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT content FROM feed;')
    result.map { |item| item['content'] }
  end

  def self.names
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT name FROM feed;')
    result.map { |item| item['name'] }
  end

end
