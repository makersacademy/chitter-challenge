require 'pg'
require 'dotenv/load'

class Peeps

  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
    # Time.now.strftime "%d/%m/%Y %H:%M"
  end

  def self.all
    connection = PG.connect(dbname: ENV['DATABASE'])
    query = 'SELECT * FROM peeps;'
    results = connection.exec(query)
    results.map do |chitter|
      Peeps.new(id: chitter['id'], message: chitter['message'], time: '1')
    end
  end

  def self.create(peep:)
    connection = PG.connect(dbname: ENV['DATABASE'])
    query = "INSERT INTO peeps(message) VALUES('#{peep}');"
    results = connection.exec(query)
    Peeps.new(id: results[0]['id'], message: results[0]['message'], time: '1')
  
  end
end
