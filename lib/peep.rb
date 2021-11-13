require 'pg'

class Peep 
  
  attr_reader :id, :username, :message

  def initialize(id:, username:, message:)
    @id = id
    @username = username
    @message = message
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_data_test')
    else
      connection = PG.connect(dbname: 'chitter_data')
    end
    result = connection.exec "SELECT * FROM peeps;"
    result.map do |peep|
      Peep.new(id: peep['id'], username: peep['username'], message: peep['message'])
    end
  end

  def self.add(username, message)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_data_test')
    else
      connection = PG.connect(dbname: 'chitter_data')
    end

    result = connection.exec_params("INSERT INTO peeps (username, message) VALUES($1, $2) RETURNING id, username, message;", [username, message] )
    Peep.new(id: result[0]['id'], username: result[0]['username'], message: result[0]['message'])
  end

end
