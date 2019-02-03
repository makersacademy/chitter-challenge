require 'pg'
require 'dotenv/load'

class Peeps

  def self.all
    connection = PG.connect(dbname: ENV['DATABASE'])
    query = 'SELECT * FROM peeps;'
    results = connection.exec(query)
    results.map do |chitter|
      chitter['message']
    end
  end

  def self.create(peep:)
    connection = PG.connect(dbname: ENV['DATABASE'])
    query = "INSERT INTO peeps(message) VALUES('#{peep}');"
    connection.exec(query)
  end
end
