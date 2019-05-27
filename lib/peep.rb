require 'pg'

class Peep
  attr_reader :id, :content, :time

  def initialize(id:, content:, time:)
    @id = id
    @content = content
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chit_test')
    else
      connection = PG.connect(dbname: 'chit')
    end

    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(id: peep['id'], content: peep['content'], time: peep['time'])
    end.reverse
  end

  def self.create(content:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chit_test')
    else
      connection = PG.connect(dbname: 'chit')
    end
    uktime = Time.now.strftime("%d %^b %Y, %H:%M")
    result = connection.exec("INSERT INTO peeps(content, time) VALUES('#{content}', '#{uktime}') RETURNING id, content, time;")
    Peep.new(id: result[0]['id'], content: result[0]['content'], time: result[0]['time'])
  end
end
