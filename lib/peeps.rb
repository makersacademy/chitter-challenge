require 'pg'

class Peeps
  attr_reader :id, :body, :post_time
  def initialize(id:, body:, post_time:)
    @id = id
    @body = body
    @post_time = post_time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec('SELECT * FROM peeps ;')
    result.map do |peep| 
      Peeps.new(id: peep['id'], body: peep['body'], post_time: peep['post_time'])
    end
  end

  def self.add(body:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (body) VALUES ('#{body}') RETURNING id, body, post_time")
    Peeps.new(id: result[0]['id'], body: result[0]['body'], post_time: result[0]['post_time'])
  end
end