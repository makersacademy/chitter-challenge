require 'pg'

class Peep
  attr_reader :text, :time

  def initialize(text:, time:)
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
             RETURNING text, to_char(time, 'HH24:MI - DD Mon YYYY') AS time;"

    peep = connection.exec(query)
    Peep.new(text: peep[0]['text'], time: peep[0]['time'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    query = "SELECT text, to_char(time, 'HH24:MI - DD Mon YYYY') AS time
             FROM peeps
             ORDER BY id DESC;"
             
    result = connection.exec(query)
    result.map { |peep| Peep.new(text: peep['text'], time: peep['time']) }
  end
end
