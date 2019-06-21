require 'pg'

class Chitter

  attr_reader :peeps

  def initialize
    @peeps = []
  end

  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT * FROM chitters')
    result.map { |chitter| chitter['peep'] }
  end

  def add_message(message)
    @peeps << message
  end
end
