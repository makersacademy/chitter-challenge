require 'pg'
class Peep
  attr_reader :id, :content, :time

  def initialize(id:, content:, time:)
    @id = id
    @content = content
    @time = time
  end

  def self.all
    select_env
    results = @connection.exec("SELECT * FROM peeps;")
    results.map { |peep| Peep.new(id: peep['id'], content: peep['content'], time: peep['time']) }.reverse
  end

  def self.create(content:, time: Time.now)
    select_env
    result = @connection.exec("INSERT INTO peeps (content, time) VALUES('#{content}', '#{time}') RETURNING id, content, time;")
    Peep.new(id: result[0]['id'], content: result[0]['content'], time: result[0]['time'])
  end

  def self.select_env
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')
    end
  end
end
