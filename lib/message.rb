require 'pg'

class Message

  def initialize(content:, id:, time:, user_id:)
    @content = content
    @id = id 
    @time = time
    @user_id = user_id
  end

  attr_reader :content, :id, :time, :user_id

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM messages;')
    result.reverse_each.map do |message|
      Message.new(content: message['message'], id: message['id'], time: message['time'], user_id: message['user_id'])
    end
  end

  def self.create (content:, user_id: "Anonymous")
    current_time = Time.new.to_s
    connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO messages (message, time, user_id) VALUES('#{content}', '#{current_time}', '#{user_id}');")
  end

end