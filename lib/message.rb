require 'pg'

class Message

    attr_reader :id, :body, :author, :date
  
  def initialize(id:, author:, body:, date:)
    @id = id
    @author = author
    @body = body
    @date = date
  end
  
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map { |peep| Message.new(id: peep['id'], author: peep['author'], body: peep['body'], date: peep['date'] ) }
  end

  def self.add(author:, body:, date:)
    if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
      else
        connection = PG.connect(dbname: 'chitter')
      end
      result = connection.exec("INSERT INTO peeps (author, body, dt) VALUES('#{author}', '#{body}', '#{date}') RETURNING id, author, body, dt;")
      Message.new(id: result[0]['id'], author: result[0]['author'], body: result[0]['body'], date: result[0]['dt'] )
  end
end