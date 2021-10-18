require 'pg'
require_relative 'peep'

class Chitter
  attr_reader :peep_log

  def initialize
    @peep_log = []
  end

  def self.all
    connection = PG.connect( dbname: 'chitter_challenge' )
    result = connection.exec( "SELECT * FROM chitter" )
    result.map { |row| row['message'] }
  end

  def post_peep(message)
    time = Time.now
    @peep_log << Peep.new(time, message)
  end

  def peep_history
    @peep_log.reverse.map { |peep| "Time: #{peep.time.strftime("%k:%M")}  Message: #{peep.message}" }
  end

end