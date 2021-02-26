require 'pg'

class Peep
  attr_reader  :id, :content

  def initialize(id:, content:)
    @id = id
    @content = content
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: chitter)
    end

    result = connection.exec("SELECT * FROM messages;")
    result.map {|message| Peep.new(id: message['id'], content: message['content'] )}
  end


  def self.add(content:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end


    result = connection.exec("INSERT INTO messages (content) VALUES ( '#{content}') RETURNING id, content")
    Peep.new( id: result[0]['id'], content: result[0]['content'] )
  end

end
