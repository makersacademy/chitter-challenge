require 'pg'
# rename file
class Peep

  attr_reader :id, :peep, :time, :name, :username

  def initialize(id:, peep:, time:, name:, username:)
    @time = time
    @peep = peep
    @id = id
    @name = name
    @username = username
  end

  def self.all
    database_connection
    rs = @connection.exec("SELECT * FROM peeps;")
    feed = rs.map do |post| 
      Peep.new(id: post['id'], peep: post['peep'], time: post['post_time'], name: post['name'], username: post['name'])
    end
    feed.sort_by { |peep| peep.time }.reverse!
  end

  def self.create(peep:, time:, name:, username:)
    database_connection
    result = @connection.exec("INSERT INTO peeps (peep, post_time, name, username) VALUES('#{peep}', '#{time}', '#{name}', '#{username}') RETURNING id, peep, post_time, name, username")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], time: result[0]['post_time'], name: result[0]['name'], username: result[0]['username'])
  end

  private 
    
  def self.database_connection
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_manager_test')
    else
      @connection = PG.connect(dbname: 'chitter_manager')
    end
  end  
end
