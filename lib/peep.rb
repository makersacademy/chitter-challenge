require 'pg'

class Peep

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec('SELECT * FROM peeps ORDER BY time DESC;')
    result.map do |peep|
      Peep.new(id: peep['id'], content: peep['content'], time: peep['time'])
    end
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter_test')
    end
    result = connection.exec("INSERT INTO peeps (content)
                                   VALUES ('#{content}')
                                RETURNING id, content, time;")
    Peep.new(id: result[0]['id'], content: result[0]['content'], time: result[0]['time'])
  end

  def initialize(id:, content:, time:)
    @id = id
    @content = content
    @time = time
  end

  attr_reader :id, :content

  def time
    Time.parse(@time).strftime('%b %e %I:%M%P')
  end
end
