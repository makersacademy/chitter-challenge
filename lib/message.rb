require 'pg'

class Message

  attr_reader :message

  def initialize(message:)
    @message = message
  end

  def self.display
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end
    result = connection.exec("SELECT * FROM chitter")
    result.map { |tweet| tweet['message'] }
  end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end
    result = connection.exec("INSERT INTO chitter (message) VALUES('#{message}') RETURNING message;")
    Message.new(message: result[0]['message'])
  end



end
