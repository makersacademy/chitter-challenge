require 'pg'
class Chat

  attr_reader :id, :text, :created_at

  def initialize(id:,text:,created_at:)
    @id = id
    @text = text
    @created_at = created_at
  end


  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM messages;")
    result.map {|message| message['text']
      Chat.new(id: message['id'], text: message['text'], created_at: message['created_at'])
    }
  end

  def self.create(text:, created_at:)

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO messages (text, created_at) VALUES('#{text}', '#{created_at}') RETURNING id, text, created_at")

  end









end