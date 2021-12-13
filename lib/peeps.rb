require 'pg'

class Peep
  
  attr_reader :id, :username, :message

  def initialize(id:, username:, message:)
    @id = id
    @username = username
    @message = message
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep| 
      Peep.new(id: peep['id'], username: peep['username'], message: peep['message'])
    end
  end

  def self.post(username:, message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (username, message) VALUES('#{username}', '#{message}') RETURNING id, username, message;")
    Peep.new(id: result[0]['id'], username: result[0]['username'], message: result[0]['message'])
  end

end