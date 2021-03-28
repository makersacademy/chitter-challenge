require 'pg'

class Peep
  attr_reader :id, :body, :time, :username

  def initialize(id, body, time, username)
    @id = id
    @body = body
    @time = time
    @username = username
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")

    result.map do |peep|
      Peep.new(peep['id'], peep['body'], peep['time'], peep['username'])
    end
  end

  def self.add(body, username, time = Time.now.strftime('%a, %d %b %Y %H:%M:%S'))
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (body, time, username) VALUES('#{body}', '#{time}', '#{username}') RETURNING id, body, time, username;")
    Peep.new(result[0]['id'], result[0]['body'], result[0]['time'], result[0]['username'])
  end
end
