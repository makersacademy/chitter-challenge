require 'pg'
require 'uri'
# require_relative './database_connection.rb'
class Peep
  attr_reader :id, :username, :time, :message

  def initialize(id:, username:, time:, message:)
    @id = id
    @username = username
    @time = time
    @message = message
  end

  def self.all
    result = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(
      id: peep['id'],
      username: peep['username_id'],
      time: peep['time'],
      message: peep['message'])
    end
  end

  def self.create(message:, username_id:)
    PG.connect(dbname: 'chitter_test').query("INSERT INTO peeps (message,username_id) VALUES ('#{message}','#{username_id}');")
  end
end
