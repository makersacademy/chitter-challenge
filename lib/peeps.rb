require 'pg'

class Peep
  attr_reader :post_time, :message, :username

  def initialize(post_time:, message:, username:)
    @post_time = post_time
    @message = message
    @username = username
  end

  def self.all
    connection = check_environment
    results = connection.exec("SELECT post_time, message, username FROM peeps")
    results.map do |result|
      Peep.new(post_time: result['post_time'], message: result['message'], username: result['username'])
    end
  end

  def self.create(post_time:, message:, username:)
    connection = check_environment
    result = connection.exec("INSERT INTO peeps (post_time, message, username) VALUES ('#{post_time}', '#{message}', '#{username}') RETURNING post_time, message, username")
    Peep.new(post_time: result[0]['post_time'], message: result[0]['message'], username: result[0]['username'])
  end

  def self.check_environment
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end
end
