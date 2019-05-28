require 'pg'

class Peep

  attr_reader :name, :username, :peep, :time

  def initialize(name, username, peep, time)
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
    connection.exec("INSERT INTO peeps (name, username, peep, time) VALUES('#{@name}', '#{@username}', '#{@peep}', '#{@time}') RETURNING name, username, peep, time;")
  end

  def self.all
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.query("SELECT * FROM peeps;")
    result.map { |peep| Peep.new(name: peep['name'], username: peep['username'], peep: peep['peep'], time: peep['time']) }.reverse
  end
end
