require 'pg'

class Chitter 

  attr_reader :message, :id, :time

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else 
      con = PG.connect :dbname => 'chitter'
    end
    retrieve_all = con.exec "SELECT * FROM peeps"
    retrieve_all.map do |column|
      Chitter.new(message: column['message'], id: column['id'], time: column['time'])
    end

  end

  def self.add(message)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else 
      con = PG.connect :dbname => 'chitter'
    end

    result = con.exec("INSERT INTO peeps (message, time) VALUES('#{message}', '#{Time.new}') RETURNING id, message, time;")
    Chitter.new(id: result[0]['id'], message: result[0]['message'], time: result[0]['time'])

  end

  def initialize(message:, id:, time:)
    @message = message
    @id = id
    @time = time
  end

end