require 'pg'

class Peeps
  attr_reader :id, :userid, :content, :time

  def initialize(id:, userid:, content:, time:)
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
      Peeps.new(id: peep['id'], userid: peep['userid'], content: peep['content'], time: peep['time'])
    end
  end

  def self.create(userid, content, time)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (userid, content, time) VALUES('#{userid}', '#{content}', '#{time}')")
  end

end
