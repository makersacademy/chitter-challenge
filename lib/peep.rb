require 'pg'

class Peep

  attr_reader :name, :username, :post, :time

  def initialize(name, username, post, time)
    @name = name
    @username = username
    @post = post
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_database_test')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY time DESC")
    result.map { |peep| Peep.new(peep['name'], peep['username'], peep['post'], peep['time']) }
  end

  def self.post
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_database_test')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end
    time = Time.now
    connection.exec("INSERT INTO peeps (name, username, post, time) VALUES ('#{name}', '#{username}', '#{post}', '#{time}')")
  end
end
