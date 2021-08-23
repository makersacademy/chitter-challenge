require 'pg'
require_relative 'database_connection'

class Peep

  attr_reader :id, :peep, :maker, :created_at

  def initialize(id:, peep:, maker:, created_at:)
    @id = id
    @peep = peep
    @maker = maker
    @created_at = created_at
  end

  def self.all
    result =  DatabaseConnection.query('SELECT * FROM peeps ORDER BY created_at DESC')

    result.map do |row|
      Peep.new(id: row['id'], peep: row['peep'], maker: row['maker'], created_at: row['created_at'])
    end
  end

  def self.create(peep, maker=nil)
    rs = DatabaseConnection.connection.exec_params("INSERT INTO peeps (peep, maker) VALUES ($1, $2) RETURNING id, peep, maker;", [peep, maker])
    Peep.new(id: rs[0]['id'], peep: rs[0]['peep'], maker: rs[0]['maker'], created_at: rs[0]['created_at'])
  end

  def comments
    # peep below is peep_id within comments table
    DatabaseConnection.query("SELECT * FROM comments WHERE peep = $1;",[id])
  end

end
