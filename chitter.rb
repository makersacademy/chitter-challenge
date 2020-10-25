require 'pg'

class Chitter 

  attr_reader :message, :id

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else 
      con = PG.connect :dbname => 'chitter'
    end
    retrieve_all = con.exec "SELECT * FROM peeps"
    retrieve_all.map do |column|
      Chitter.new(message: column['message'], id: column['id'])
    end

  end

  def self.add(message)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else 
      con = PG.connect :dbname => 'chitter'
    end

    result = con.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message;")
    Chitter.new(id: result[0]['id'], message: result[0]['message'])
    
  end

  def initialize(message:, id:)
    @message = message
    @id = id
  end

end