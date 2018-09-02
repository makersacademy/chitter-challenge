require 'pg'

class Peep

  attr_reader :id, :peep, :order

  def initialize(id, peep)
    @id = id
    @peep = peep
    @order = true
  end

  def self.all
    create_connection_to_database
    result = @connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
    @order = true
    result.map do |peep|
      Peep.new(peep['id'], peep['peep'])
    end
  end

  def self.all_asc
    create_connection_to_database
    result = @connection.exec("SELECT * FROM peeps;")
    @order = false
    result.map do |peep|
      Peep.new(peep['id'], peep['peep'])
    end
  end

  def self.create(peep)
    create_connection_to_database
    result = @connection.exec("INSERT INTO peeps(peep) VALUES ('#{ peep }') RETURNING id, peep; ")
    Peep.new(result[0]['id'], result[0]['peep'])

  end

  private

  def self.create_connection_to_database
    ENV['RACK_ENV'] == 'test' ? (db = 'chitter_test') : (db = 'chitter')
    @connection = PG.connect(dbname: db)
  end
end