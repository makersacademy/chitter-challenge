require 'pg'

class Peep
  attr_reader :id, :name, :username, :message, :time
def initialize(id, username, message, time, name)
  @id = id
  @name = name
  @username = username
  @message = message
  @time = time
end
  def self.testing
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end

  def self.all
    Peep.testing
    result = @connection.exec("SELECT * FROM peeps")
    results = result.sort_by { |peep| peep['id'].to_i }.reverse!
    results.map { |peep| Peep.new(peep['id'], peep['username'], peep['message'], peep['time'], peep['name']) }
  end


  def self.reverse(username)
    Peep.testing
    result = @connection.exec("SELECT * FROM peeps WHERE username = '#{username}'")
    result.sort_by { |peep| peep['id'].to_i }.reverse!
  end

  def self.add(username, name, message)
    Peep.testing
    result = @connection.exec("INSERT INTO peeps(username, message, time, name) VALUES('#{username}', '#{message}', '#{Time.now}', '#{name}') RETURNING id, username, message, time, name")
    Peep.new(result.first['id'], result.first['username'], result.first['message'], result.first['time'], result.first['name'])
  end

  def ==(other)
    @id = other.id
  end
end
