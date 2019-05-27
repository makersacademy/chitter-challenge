require_relative './database_connection.rb'

class Peep
  attr_reader :id, :text, :time, :userid

  def initialize(id:, text:, time:, userid:)
    @id = id
    @text = text
    @time = time
    @userid = userid
  end

  def self.post(text:, userid:)
    sql = "INSERT INTO peeps (text, userid) VALUES('#{text}', #{userid})
           RETURNING id, text, to_char(time,'HH24:MI - DD Mon YYYY') AS time,
                     userid;"

    peep = DatabaseConnection.query(sql).first

    Peep.new(id: peep['id'], text: peep['text'], time: peep['time'],
             userid: peep['userid'])
  end

  def self.all
    sql = "SELECT id, text, to_char(time, 'HH24:MI - DD Mon YYYY') AS time,
                  userid
           FROM peeps ORDER BY id DESC;"

    result = DatabaseConnection.query(sql)

    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], time: peep['time'],
               userid: peep['userid'])
    end
  end

  def user_info
    sql = "SELECT name, username FROM users WHERE id = #{@userid}"
    DatabaseConnection.query(sql).first
  end
end
