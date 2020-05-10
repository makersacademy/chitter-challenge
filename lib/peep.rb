require 'pg'

class Peep

  attr_reader :id, :text, :date_and_time

  def initialize(id:, text:, date_and_time:)
    @id = id
    @text = text
    @date_and_time = date_and_time
  end


  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| Peep.new(id: peep['id'], text: peep['text'], date_and_time: peep['date_and_time']) }
  end


  def self.add(text:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    date_and_time = Time.new
    result = connection.exec("INSERT INTO peeps (text, date_and_time) VALUES ('#{text}', '#{date_and_time}') RETURNING id, text, date_and_time;")
    Peep.new(id: result[0]['id'], text: result[0]['text'], date_and_time: result[0]['date_and_time'])
  end

end
