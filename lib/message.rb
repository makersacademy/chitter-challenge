require 'pg'

class Message

  def self.create(content)
    @message = Message.new(content)
  end

  def self.instance
    @message
  end

  def initialize(content)
    @content = content
  end

  attr_reader :content

end