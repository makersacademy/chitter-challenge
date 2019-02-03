require 'pg'
require 'dotenv/load'

class Peeps

  def self.all
    connection = PG.connect(dbname: ENV['DATABASE'])
    query = 'SELECT * FROM peeps;'
    results = connection.exec(query)
    results.map do |chitter|
      chitter['peeps']
    end
  end

  def self.create
  end
end