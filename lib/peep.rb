require 'pg'
require 'time'

class Peep
  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end

  def self.create(message:)
    result = db_connection.exec "INSERT INTO peeps (message) VALUES ('#{message}') RETURNING id, message, date_time_stamp;"
    Peep.new(id: result.first['id'], message: result.first['message'], time: Time.parse(result.first['date_time_stamp']))
  end

  def self.find(id:)
    result = db_connection.exec "SELECT * FROM peeps WHERE id = #{id};"
    Peep.new(id: result.first['id'], message: result.first['message'], time: Time.parse(result.first['date_time_stamp']))
  end

  def self.all
    result = db_connection.exec "SELECT * FROM peeps ORDER BY id desc;"
    @peeps = result.map do |row|
      Peep.new(id: row['id'], message: row['message'], time: Time.parse(row['date_time_stamp']))
    end
  end

  def self.db_connection
    if ENV['RACK_ENV'] == 'test'
      PG.connect :dbname => 'chitter_test'
    else
      PG.connect :dbname => 'chitter'
    end
  end

end
