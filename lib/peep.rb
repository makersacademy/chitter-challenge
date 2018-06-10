require 'pg'

class Peep
  attr_reader :id, :peep, :created_at

  def initialize(id, peep, created_at)
    @id = id
    @peep = peep
    @created_at = created_at
  end

  def self.post(options)
    connection = database_connection
    result = connection.exec("INSERT INTO peeps (peep) VALUES('#{options[:peep]}') RETURNING id, peep, created_at")
    Peep.new(result.first['id'], result.first['peep'], result.first['created_at'])
  end

  def self.display
    connection = database_connection
    result = connection.exec("SELECT * FROM peeps")
    result.map { |peeps| Peep.new(peeps['id'], peeps['peep'], peeps['created_at']) }
  end

  def ==(other)
    @id == other.id
  end

  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end
end
