# require 'database_connection'

class Messages
  attr_reader :text

  def initialize(text)
    @text = text
  end

  def self.create(text)
    # result = DatabaseConnection.query("INSERT INTO messages (text, time, user_id) VALUES ('#{text}', )")
    @message = Messages.new(text)
  end

  def self.instance
    @message
  end

  # def self.see_all
  #
  # end
end
