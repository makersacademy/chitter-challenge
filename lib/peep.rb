require 'pg'

class Peep
  def self.create(username:, body:)
    time_posted = Time.now

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    query = "INSERT INTO peeps (username, body, time_posted) VALUES('#{username}', '#{body}', '#{time_posted}') RETURNING id, username, body, time_posted;"
    result = connection.exec(query)
    Peep.new(username: result[0]['username'], body: result[0]['body'], time_posted: result[0]['time_posted'], id: result[0]['id'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
    Peep.new(username: peep['username'], body: peep['body'], time_posted: peep['time_posted'], id: peep['id'])
    end
  end

  attr_reader :username, :body, :time_posted, :id
  
  def initialize(username:, body:, time_posted:, id:)
    @id = id
    @username = username
    @body = body
    @time_posted = time_posted
  end
end
