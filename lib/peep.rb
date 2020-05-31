require 'pg'

class Peep

  attr_reader :text, :time, :id

  def initialize(text:, time:, id:)
    @text = text
    @time = time 
    @id = id 
  end 

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peep_record ORDER BY time DESC;")
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
    
    result = connection.exec("INSERT INTO peep_record (text, time) VALUES('#{text}','#{time}') RETURNING id, text, time;")
    Peep.new(id: result[0]['id'], text: result[0]['text'], time: result[0]['time'])
  end 
end 
