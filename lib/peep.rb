require 'database_connection'

class Peep
  attr_reader :text, :time

  def initialize(id:, text:, time:)
    @id = id
    @text = text
    @time = time
  end

  def self.post(text:)
    sql = "INSERT INTO peeps (text) VALUES('#{text}')
             RETURNING id, text, to_char(time,'HH24:MI - DD Mon YYYY') AS time;"

    peep = DatabaseConnection.query(sql).first

    Peep.new(id: peep['id'], text: peep['text'], time: peep['time'])
  end

  def self.all
    sql = "SELECT text, to_char(time, 'HH24:MI - DD Mon YYYY') AS time
             FROM peeps ORDER BY id DESC;"

    result = DatabaseConnection.query(sql)

    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], time: peep['time'])
    end
  end
end
