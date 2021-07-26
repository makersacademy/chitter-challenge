require 'pg'
require './app'

class Logic 

  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end 
  def self.all
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: "chitter_test")
    else
      conn = PG.connect(dbname: "chitter")
    end
  db = conn.exec('SELECT * FROM user_data')
  db.map do |col|
    Logic.new(id: col['id'], peep: col['peep'] )
  end
end

  def self.create(peep:)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: "chitter_test")
    else
      conn = PG.connect(dbname: "chitter")
    end
    conn.exec("INSERT INTO user_data(peep) VALUES ('#{peep}')RETURNING peep") 
  end 
end


