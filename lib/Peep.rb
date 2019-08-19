require 'time'
require 'pg'

class Peep
  $connection = PG.connect(dbname: 'chitter')

  attr_reader :peepid, :body, :userid, :username, :time, :current_time

  def initialize(peepid:, body:, userid:, time:)
    @body = body
    @peepid = peepid
    @userid = userid
    @username = set_username
    @time = set_time
  end


  def self.all
    result = $connection.exec("SELECT * FROM peeps;")
    result.map { |peep|
      Peep.new(
        body: peep['body'],
        peepid: peep['peepid'],
        userid: peep['userid'],
        time: peep['peeptime']
      )
    }
  end

  def self.create(body, userid)
    insert = $connection.exec(
      "INSERT INTO peeps (body, userid, peeptime) VALUES('#{body}', #{userid}, '#{Time.new.httpdate}');"
    )

    result = $connection.exec("SELECT * FROM peeps WHERE body = '#{body}';").to_a.pop

    Peep.new(
      peepid: result.fetch('peepid').to_i,
      body: result.fetch('body'),
      userid: result.fetch('userid').to_i,
      time: result.fetch('peeptime')
    )

  end

  def set_username
    result = $connection.exec("select username from users where userid = #{userid}").to_a.pop
    result.fetch('username')
  end

  def set_time
    result = $connection.exec("select peeptime from peeps where peepid = #{peepid}").to_a.pop
    result.fetch('peeptime')
  end

end
