require 'pg'
require_relative 'database_connection'

class Peep

  attr_reader :id, :peep, :maker

  def initialize(id:, peep:, maker:)
    @id = id
    @peep = peep
    @maker = maker
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end
    result = con.exec('SELECT * FROM peeps')
    test = result.map do |row|
      Peep.new(id: row['id'], peep: row['peep'], maker: row['maker'])
    end
    # result = DatabaseConnection.query("SELECT * FROM peeps")

    result.map do |row|
      Peep.new(id: row['id'], peep: row['peep'], maker: row['maker'])
    end
  end

  def self.create(peep)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end
    rs = con.exec("INSERT INTO peeps (peep) VALUES ($1) RETURNING id, peep, maker;", [peep])

    # rs = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES ($1) RETURNING id, peep;", [peep])
    Peep.new(id: rs[0]['id'], peep: rs[0]['peep'], maker: 1)

  end






end