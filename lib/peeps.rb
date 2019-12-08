require 'pg'

class Peeps
  attr_reader :username, :id, :userid, :content, :time

  def initialize(username:, id:, userid:, content:, time:)
    @username = username
    @id = id
    @userid = userid
    @content = content
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peeps.new(username: peep['username'], id: peep['id'], userid: peep['userid'], content: peep['content'], time: peep['time'])
    end
  end

  def self.create(username:, userid:, content:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (username, userid, content, time) VALUES('#{username}', '#{userid}', '#{content}', '#{time}') RETURNING username, id, userid, content, time")
    Peeps.new(username: result[0]['username'], id: result[0]['id'], userid: result[0]['userid'], content: result[0]['content'], time: result[0]['time'])
  end

end
