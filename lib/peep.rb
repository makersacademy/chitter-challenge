require 'pg'

class Peep

  attr_reader :text

  def initialize(text)
    @text = text
  end

  def self.all
    @connection = connection
    rs = @connection.exec( "SELECT text FROM peeps" )

    puts rs

    rs.map { |peep| Peep.new(peep['text']) }
  end

  private

  def self.connection
    if ENV['RACK_ENV'] == 'test'
      return PG.connect :dbname => 'chitter_test'
    else
      return PG.connect :dbname => 'chitter'
    end
  end

end
