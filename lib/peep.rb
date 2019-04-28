require 'pg'

class Peep
  attr_reader :post, :time

  def initialize(post:, time:)
    @post = post
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    all = connection.exec('SELECT * FROM peeps');
    all.map do |peep|
      Peep.new(post: peep['post'], time: peep['time'])
    end
  end

  def self.add(post:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (post, time) VALUES ('#{post}', '#{time}') RETURNING post, time")
    Peep.new(post: result[0]['post'], time: result[0]['time'])
  end
end
