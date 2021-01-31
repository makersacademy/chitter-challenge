require 'pg'

class Peep
  attr_reader :time, :content, :id

  def initialize(content:, time:, id:)
    @time = Time.now.strftime("%H:%M")
    @content = content
    @id = id
  end

  def self.all
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname:'chitter_test')
    else
      connection = PG.connect(dbname:'chitter_db')
    end
    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(
        content: peep['content'],
        time: peep['time']
      )
    end
    .reverse
  end

  def self.create(content:)
    if ENV['ENVIROMENT'] == 'test'
      connection = PG.connect(dbname:'chitter_test')
    else
      connection = PG.connect(dbname:'chitter_db')
    end
    result = connection.exec("INSERT INTO peeps(content, time) VALUES ('#{content}') RETURNING id, content, time;")
    Peep.new(
      id: result[0]['id'],
      time: result[0]['time'],
      content: result[0]['content']
      )
  end

end
