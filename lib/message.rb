require 'pg'

class Message

    attr_reader :body, :author, :date
  
  def initialize(author:, body:, date:)
    @author = author
    @body = body
    @date = date
  end
  
  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps")
    result.map { |peep| Message.new( author: peep['author'], body: peep['body'], date: peep['date'] ) }
  end
end