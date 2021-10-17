require 'pg'
require './lib/all_messages'

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
    result.map do |message|
      Message.new(content: message['message'], id: message['id'], time: message['time'])
    end
  end

end