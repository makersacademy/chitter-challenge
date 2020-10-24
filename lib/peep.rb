require 'pg'

class Peep
  attr_reader :content, :id, :time
  
  def initialize(content, id, time)
    @content = content
    @id = id
    @time = time
  end

  def self.create(content)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'chitter_manager_test'
    else
      connection = PG.connect :dbname => 'chitter_manager'
    end
    time = Time.now.strftime("%d/%m/%Y, %I:%M %p")
    result = connection.exec("INSERT INTO peeps (content, time) VALUES('#{content}', '#{time}') RETURNING id, content, time;")
    @peep = Peep.new(result[0]['content'], result[0]['id'], result[0]['time'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect :dbname => 'chitter_manager_test'
    else
      connection = PG.connect :dbname => 'chitter_manager'
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map do |peep|
      Peep.new(peep['content'], peep['id'], peep['time'])
    end
  end
end
