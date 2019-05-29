require 'pg'

class Peep

  attr_reader :name, :username, :peep, :time

  def initialize(name:, username:, peep:, time:)
    @name = name
    @username = username
    @peep = peep
    @time = time
  end

  def add
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (name, username, peep, time) VALUES('#{@name}', '#{@username}', '#{@peep}', '#{@time}') RETURNING name, username, peep, time;")
    Peep.new(name: result[0]['name'], username: result[0]['username'], peep: result[0]['peep'], time: result[0]['time'])

  end

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| Peep.new(name: peep['name'], username: peep['username'], peep: peep['peep'], time: peep['time']) }.reverse
  end
end
