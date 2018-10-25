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
      conn = PG.connect(dbname: 'chitter_manager_test')
    else
      conn = PG.connect(dbname: 'chitter_manager')
    end
    result = conn.exec( "SELECT * FROM peeps ORDER BY time DESC" )
    result.map { |peep| Peep.new(peep['name'], peep['username'], peep['post'], peep['time']) }
  end

  def self.post(name, username, post)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_manager_test')
    else
      conn = PG.connect(dbname: 'chitter_manager')
    end
    conn.exec("INSERT INTO peeps (name, username, post) VALUES ('#{name}', '#{username}', '#{post}');")
  end

end
