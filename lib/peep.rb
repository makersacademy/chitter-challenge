require 'pg'

class Peep

  attr_reader :id, :peep

  def initialize(id, peep)
    @id = id
    @peep = peep
  end

  def self.all
    create_connection_to_database
    result = @connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(peep['id'], peep['peep'])
    end
  end

  private

  def self.create_connection_to_database
    ENV['RACK_ENV'] == 'test' ? (db = 'chitter_test') : (db = 'chitter')
    @connection = PG.connect(dbname: db)
  end
end