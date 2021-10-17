require 'pg'
require './lib/all_messages'

class Message

  def initialize(content:)
    @content = content
  end

  attr_reader :content

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM messages;')
    result.map do |message|
      Message.new(content: message['message'])
    end
  end

end