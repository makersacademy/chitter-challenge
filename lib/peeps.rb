require 'pg'
require 'time'

class Peep
  attr_reader :id, :peep, :username, :timestamp
  def initialize id:, peep:, username:, timestamp:
    @id = id
    @timestamp = timestamp.to_i
    @peep = peep
    @username = username
    @time = Time.at(timestamp)
  end

  def time
    @timestamp < 0 ? year = "%Y" : year = "%y"
    str = "%d/%m/#{year} (%a) %H:%M"
    Time.at(@timestamp).strftime(str)
  end

  class << self

    def all
      connection = make_connection()
      result = connection.exec('SELECT * FROM peeps ORDER BY id DESC')
      result.map do |peep|
        Peep.new(id: peep['id'], peep: peep['peep'], username: peep['username'], timestamp: peep['timestamp'].to_i)
      end
    end

    def create peep:, username:, timestamp:
      connection = make_connection()
      result = connection.exec("INSERT INTO peeps (peep, username, timestamp) VALUES ('#{peep}', '#{username}', '#{timestamp}') RETURNING peep, username, timestamp;")
      Peep.new(id: result[0]['id'], peep: result[0]['peep'], username: result[0]['username'], timestamp: result[0]['timestamp'].to_i)
    end

    private

    def make_connection
      if ENV['ENVIRONMENT'] == 'test'
        return PG.connect(dbname: 'chitter_database_test')
      else
        return PG.connect(dbname: 'chitter')
      end
    end
  end
end