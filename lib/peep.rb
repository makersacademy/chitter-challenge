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
end
