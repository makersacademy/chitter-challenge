require 'pg'

class Peep

  attr_reader :id, :name, :username, :post, :time

  def initialize(id:, name:, username:, post:, time:)
    @id = id
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
    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC")
    result.map { |peep| Peep.new(id: peep['id'],name: peep['name'], username: peep['username'], post: peep['post'], time: peep['time']) }
  end

  def self.post(name:, username:, post:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_database_test')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end
    time = Time.now.asctime
    result = connection.exec("INSERT INTO peeps (name, username, post, time) VALUES ('#{name}', '#{username}', '#{post}', '#{time}') RETURNING id, name, username, post, time;")
    Peep.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], post: result[0]['post'], time: result[0]['time'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_database_test')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end
    result = connection.exec("DELETE FROM peeps WHERE id = #{id}")
  end

  def self.edit(id:, name:, username:, post:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_database_test')
    else
      connection = PG.connect(dbname: 'chitter_database')
    end
    result = connection.exec("UPDATE peeps SET post = '#{post}' WHERE id = #{id} RETURNING id, name, username, post, time;")
    Peep.new(id: result[0]['id'], name: result[0]['name'], username: result[0]['username'], post: result[0]['post'], time: result[0]['time'])
  end
end
