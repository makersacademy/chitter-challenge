require 'pg'

class Message

  # def initialize(id, text)

  #   @id = id
  #   @text = text
  #   # @username = username
  #   # @name = name
  #   # @time = time

  # end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM message")

    result.map { |message| message['text'] }

  end

end
