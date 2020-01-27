require 'pg'
require_relative 'database_connection'

class Peep
  attr_reader :peep, :created_at

  def initialize(peep:, created_at:)
    @peep = peep
    @created_at = created_at
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep| 
      Peep.new(
        peep: peep['peep'],
        timestamp: peep['timestamp']
        )
    end
  end


  self.create(params)
  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
  else
    connection = PG.connect(dbname: 'chitter')
  end
  result = connection.exec("INSERT INTO peeps ( peep, created_at ) VALUES('#{params['peep']}', '#{params['created_at']}')")
  end

  def self.find_reversed
    find.reverse
  end
end