require 'pg'
require 'date'

class Peeps
  attr_reader :message 
  def initialize(message)
    @message = message
  
  end 

  
  def self.all
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter') 
    end
    rs = conn.exec('SELECT * FROM chitter;')
    rs.map { |chitter| chitter['message'] }
  end

  def self.create(message:)
    if ENV['RACK_ENV'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
  
    conn.exec("INSERT INTO chitter (message) VALUES('#{message}')")
  end
end



