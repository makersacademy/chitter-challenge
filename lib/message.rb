require 'pg'
require_relative 'time'

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
    result = connection.exec("SELECT * FROM chitter ORDER BY id DESC")
    result.map { |tweet| tweet['message'] }
  end


  def self.create(message:)


    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_challenge_test')
    else
      connection = PG.connect(dbname: 'chitter_challenge')
    end
    n = connection.exec("SELECT name FROM users ORDER BY id DESC LIMIT 1")
    n = n.map { |item| item['name'] }
    name = n.join("")

    store_time = Time_Calculation.calculation
    result = connection.exec("INSERT INTO chitter (message) VALUES('#{name} #{message} #{store_time}') RETURNING message;")
    Message.new(message: result[0]['message'])
  end


end
