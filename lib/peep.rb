require 'pg'

class Peep

  attr_reader :id, :username, :message

  def initialize(username:, message:, id:, time:)
    @username = username
    @message = message
    @id = id
    @time = 0
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
    time = Time.new.strftime("%Y-%m-%d %H:%M").to_s
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'peeps_test')
    else
      connection = PG.connect(dbname: 'peeps')
    end
    result = connection.exec("INSERT INTO peeps (username, peep, time)
    VALUES('#{username}', '#{message}',
      '#{time}')
      RETURNING id, username, peep, time;")
    Peep.new(id: result[0]['id'], username: result[0]['username'],
       message: result[0]['peep'], time: result[0]['time'])
  end
end
