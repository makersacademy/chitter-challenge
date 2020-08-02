require 'pg'

class Peep

  attr_reader :id, :username, :message

  def initialize(username:, message:, id:)
    @username = username
    @message = message
    @id = id
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end
    result = connection.exec('SELECT * FROM peeps')
    result.map { |line| line }
  end

  def self.add(username:, message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end
    result = connection.exec("INSERT INTO peeps (username, peep)
    VALUES('#{username}', '#{message}') RETURNING id, username, peep;")
    Peep.new(id: result[0]['id'], username: result[0]['username'],
       message: result[0]['peep'])
  end
end
