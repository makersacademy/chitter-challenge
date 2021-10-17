require 'pg'

class Message

  def initialize(content:, id:, time:)
    @content = content
    @id = id 
    @time = time
  end

  attr_reader :content, :id, :time

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM messages;')
    result.reverse_each.map do |message|
      Message.new(content: message['message'], id: message['id'], time: message['time'])
    end
  end

  def self.create (content:)
    current_time = Time.new.to_s
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO messages (message, time) VALUES('#{content}', '#{current_time}');")
    #connection.exec("INSERT INTO messages (message, time) VALUES('#{content}', '#{current_time}') RETURNING id, message, time;")
  end

  # Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])

end