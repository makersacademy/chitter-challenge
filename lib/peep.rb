require_relative './database_connection.rb'

class Peep
  attr_reader :id, :text, :time

  def initialize(id:, text:, time:, userid:)
    @id = id
    @text = text
    @time = time
    @userid = userid
  end

  def self.post(text:, userid:)
    sql = "INSERT INTO peeps (text) VALUES('#{text}')
           RETURNING id, text, to_char(time,'HH24:MI - DD Mon YYYY') AS time,
                     userid;"

    peep = DatabaseConnection.query(sql).first

    Peep.new(id: peep['id'], text: peep['text'], time: peep['time'],
             userid: peep['userid'])
  end

  def self.all
    sql = "SELECT text, to_char(time, 'HH24:MI - DD Mon YYYY') AS time
           FROM peeps ORDER BY id DESC;"

    result = DatabaseConnection.query(sql)

    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], time: peep['time'],
               userid: peep['userid'])
    end
  end
end
