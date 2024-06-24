require 'pg'

class Peep

  attr_reader :content, :id, :time

  def initialize(id:, content:, time:)
    @id = id
    @content = content
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else 
      conn = PG.connect(dbname: 'chitter')
    end
    records = conn.exec("SELECT * FROM peeps")
    records.map do |peep|
      Peep.new(id: peep['id'], content: peep['content'], time: peep['time_stamp'])
    end     
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: 'chitter_test')
    else
      conn = PG.connect(dbname: 'chitter')
    end
    records = conn.exec_params(
"INSERT INTO peeps (content) VALUES($1) RETURNING id, content, time_stamp;", [content])
    Peep.new(id: records[0]['id'], content: records[0]['content'], 
time: records[0]['time_stamp'])
  end
end
