require 'pg'

class Peep
  attr_reader :id, :text, :time

  def initialize(id:, text:, time:)
    @id  = id
    @text = text
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM peeps;')
    result.map do |peep|
      Peep.new(id: peep['id'], text: peep['text'], time: peep['time'])
    end
  end

  
  def self.create(text:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO peeps (text,time) VALUES('#{text}','#{time}') RETURNING id, text, time;")
  end
end
