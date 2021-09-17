require 'pg'

class Chitter
  attr_reader :peeps

  def initialize
    @peeps = []
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect( dbname: 'chitter_test' )
    else
      connection = PG.connect( dbname: 'chitter' )
    end
    result = connection.exec( "SELECT * FROM chitter" )
    result.map { |row| row['message'] }
  end

  def post(peep)
    @peeps << Peep.new(time: Time.now, message: peep)
  end

  def list_peeps
    @peeps.reverse.map { |peep| "#{peep.time.strftime("%k:%M")} - #{peep.message}" }
  end
end