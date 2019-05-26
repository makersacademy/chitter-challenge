require 'pg'

class Peep
  attr_reader :text, :time

  def initialize(id:, text:, time:)
    @id = id
    @text = text
    @time = time
  end

  def self.post(text:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    query = "INSERT INTO peeps (text) VALUES('#{text}')
             RETURNING id, text, to_char(time,'HH24:MI - DD Mon YYYY') AS time;"

    peep = connection.exec(query).first
    Peep.new(id: peep['id'], text: peep['text'], time: peep['time'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT text, to_char(time, 'HH24:MI - DD Mon YYYY')
                              AS time
                              FROM peeps
                              ORDER BY id DESC;")

    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], time: peep['time'])
    end
  end
end
