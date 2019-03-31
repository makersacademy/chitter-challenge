require 'pg'

class Peep

  attr_reader :id, :content, :time

  def initialize(id:, content:, time:)
    @id = id
    @content = content
    @time = time
  end

  def self.create(content:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (peep, time) VALUES ('#{content}', '#{Time.now}') RETURNING id, peep, time;")
    Peep.new(id: result[0]['id'], content: result[0]['peep'], time: result[0]['time'])
  end

end
