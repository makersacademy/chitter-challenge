require 'pg'

class Peep
  attr_reader :peep, :id, :time

  def initialize(id, peep, time = Time.now)
    @id = id
    @peep = peep
    @time = time
  end

  def self.all
    connect_to_database do |connection|
      result = connection.exec("SELECT * FROM peeps;")
      result.map { |peep| Peep.new(peep['id'], peep['peep']) }
    end
  end

  def self.create(peep)
    connect_to_database do |connection|
      result = connection.exec("INSERT INTO peeps (peep) VALUES ('#{peep}') RETURNING id, peep")
      Peep.new(result[0]['id'], result[0]['peep'])
    end
  end

  private

  def self.connect_to_database
    dbname = ENV['RACK_ENV'] == 'test' ? 'chitter_test' : 'chitter'
    connection = PG.connect(dbname: dbname)
    yield(connection) if block_given? 
  ensure
    connection.close if connection
  end 
end