require 'pg'
# require_relative 'database_connection'

class Peep

  attr_reader :id, :peep, :maker, :created_at

  def initialize(id:, peep:, maker:, created_at:)
    @id = id
    @peep = peep
    @maker = maker
    @created_at = created_at
  end

  def self.all
    if ENV['RACK_ENV'] = 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end
    result = con.exec('SELECT * FROM peeps ORDER BY created_at DESC')
    # result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY timestamp ASC")

    result.map do |row|
      Peep.new(id: row['id'], peep: row['peep'], maker: row['maker'], created_at: row['created_at'])
    end
  end

  # create method to updated to to take 'maker' argument
  def self.create(peep)
    if ENV['RACK_ENV'] = 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end
    rs = con.exec("INSERT INTO peeps (peep) VALUES ($1) RETURNING id, peep, maker;", [peep])

    # rs = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES ($1) RETURNING id, peep;", [peep])

    Peep.new(id: rs[0]['id'], peep: rs[0]['peep'], maker: 1, created_at: rs[0]['created_at'])
  end

  def comments
    if ENV['RACK_ENV'] = 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end
    # peep below is peep_id within comments table
    con.exec(
      "SELECT * FROM comments WHERE peep = $1;",
      [id]
    )
  end

end
