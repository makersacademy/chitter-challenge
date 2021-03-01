require 'pg'

class Peep
  attr_reader  :id, :content, :created_at

  def initialize(id:, content:, created_at:)
    @id = id
    @content = content
    @created_at = created_at
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM messages;")
    result.map {|message| Peep.new(id: message['id'], content: message['content'], created_at: message['created_at'] )}
  end


  def self.add(content:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end


    result = connection.exec("INSERT INTO messages (content) VALUES ( '#{content}') RETURNING id, content, created_at")
    Peep.new( id: result[0]['id'], content: result[0]['content'], created_at: result[0]['created_at'] )
  end

end
