require 'pg'

class Peep 
  attr_reader :id, :timestamp, :post

  def initialize(id:, timestamp:, post:)
    @id = id
    @timestamp = timestamp
    @post = post
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM peeps")
    result.map { |peep| 
      Peep.new(id: peep['id'], timestamp: peep['timestamp'], post: peep['post']) 
    }.reverse
  end

  def self.add(post:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec_params("INSERT INTO peeps (timestamp, post) VALUES (NOW(), $1) RETURNING id, timestamp, post;", [post])
    Peep.new(id: result[0]['id'], timestamp: result[0]['timestamp'], post: result[0]['post'])
  end
end