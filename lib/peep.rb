require 'pg'
require 'time'

class Peep

  attr_reader :id, :text, :time

  def initialize(id:, text:, time:)
    @id = id
    @text = text
    @time = time
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    peeps = connection.exec("SELECT * FROM peeps;")
    peeps.map { |peep| Peep.new(id: peep['id'], text: peep['text'], time: peep['time']) }
    end

  def self.create(text:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (text, time) VALUES('#{text}', '#{Time.now}') RETURNING id, text, time")
    Peep.new(id: result[0]['id'], text: result[0]['text'], time: result[0]['time'])
  end

  def self.reverse
    peeps = Peep.all
    peeps.reverse { |peep| peep.time }
  end
end
