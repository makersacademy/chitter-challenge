require 'pg'

class Peep 
  
  attr_reader :id, :username, :message, :time

  def initialize(id:, username:, message:, time:)
    @id = id
    @username = username
    @message = message
    @time = time
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_data_test')
    else
      connection = PG.connect(dbname: 'chitter_data')
    end
    result = connection.exec "SELECT * FROM peeps ORDER BY id DESC;"
    result.map do |peep|
      Peep.new(id: peep['id'], username: peep['username'], message: peep['message'], time:['time'])
    end
  end

  def self.add(username, message)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_data_test')
    else
      connection = PG.connect(dbname: 'chitter_data')
    end

    time = Time.now

    result = connection.exec_params("INSERT INTO peeps (username, message) VALUES($1, $2) RETURNING id, username, message, time;", [username, message] )
    Peep.new(id: result[0]['id'], username: result[0]['username'], message: result[0]['message'], time: result[0]["#{Time.now}"])
  end

end
