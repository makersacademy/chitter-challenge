require 'pg'
require_relative 'database_connection'

class Peeps
  attr_reader :id, :peep

  def initialize(id:,peep:)
    @id = id
    @peep = peep
  end


  def self.create(peep:)
    result = DatabaseConnection.query("INSERT INTO test_messages (id,peep,timestamp) VALUES('#{peep}','#{Time.now.strftime("%d/%m/%Y %H:%M")}') RETURNING id, peep,users, timestamp;")
    Peeps.new(id: result[0]['id'], peep: result[0], timestamp: result[0]['timestamp'] )
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = DatabaseConnection.query("SELECT * FROM message;")
    result.map { |peep| peep['peep'] }
  end
end
