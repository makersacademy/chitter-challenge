require 'pg'
require_relative 'peep'

class Chitter
  def self.peeps
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'chitter_test' )
    else
      connection = PG.connect( dbname: 'chitter' )
    end
    result = connection.exec( "SELECT * FROM chitter" )
    result.map do |peep|
      Peep.new(id: peep['id'], time: peep['time'], message: peep['message'])
    end
  end

  def self.post(message:)
    time = Time.now.strftime("%m-%d-%Y at %H:%M")
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'chitter_test' )
    else
      connection = PG.connect( dbname: 'chitter' )
    end
    result = connection.exec_params( "INSERT INTO chitter (time, message) VALUES($1, $2) RETURNING id, time, message;", [time, message] )
    Peep.new(id: result[0]['id'], time: result[0]['time'], message: result[0]['message'])
  end
end