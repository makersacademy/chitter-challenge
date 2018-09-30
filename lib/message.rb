require 'pg'

class Message

  attr_reader :id, :name, :content

  def initialize(id:, name:, content:)
    @id = id
    @name = name
    @content = content
  end

  def self.all
    message = connect.exec('SELECT * FROM messages;')
    message.map do |message|
      Message.new(
        id: message['id'],
        name: message['name'],
        content: message['content']
      )
    end
  end

  def self.create(name:, content:)
   result = connect.exec("INSERT INTO messages (name, content) VALUES('#{name}', '#{content}') RETURNING id, name, content;")
   Message.new(id: result[0]['id'], name: result[0]['name'], content: result[0]['content'])
 end

  private

  def self.connect
    if ENV['ENVIRONMENT'] == 'test'
      return PG.connect dbname: 'messages_manager_test'
    end
    PG.connect dbname: 'messages_manager'
  end
end
