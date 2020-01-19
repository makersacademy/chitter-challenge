require 'pg'
require_relative 'peep'

class PeepList

  def self.get_peeps
    ENV['RACK_ENV'] == 'test' ? connection = PG.connect(dbname: 'chitter_test') : connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    peeps = result.map { |peep| Peep.new(peep['username'], peep['message'], peep['time']) }
    peeps_ordered = peeps.reverse
  end

  def self.add_peep(username, message)
    time = Time.new
    ENV['RACK_ENV'] == 'test' ? connection = PG.connect(dbname: 'chitter_test') : connection = PG.connect(dbname: 'chitter')
    connection.exec("INSERT INTO peeps (username, message, time) VALUES('#{username}', '#{message}', '#{time}')")
  end

end