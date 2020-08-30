require 'pg'

class Cheep

  attr_reader :id, :cheep, :timestamp

  def initialize(id:, cheep:, timestamp:)
    @id = id
    @cheep = cheep
    @timestamp = timestamp
  end

  def self.all 
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

   result = connection.exec("SELECT * FROM chitter;")
   result.map do |chitter|
    Cheep.new(id: chitter['id'], cheep: chitter['cheep'], timestamp: chitter['timestamp'])
   end
  end

  def self.create(cheep:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

      result = connection.exec("INSERT INTO chitter (cheep, timestamp) VALUES('#{cheep}', '#{Time.now}') RETURNING id, cheep, timestamp;")
      Cheep.new(id: result[0]['id'], cheep: result[0]['cheep'], timestamp: result[0]['timestamp'])
  end
end
