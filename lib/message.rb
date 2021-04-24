require 'pg'

class Message
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def self.all
    @text
  end
  
end