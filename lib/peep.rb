require 'pg'

class Peep
  attr_reader :post, :time, :name

  def initialize(post:, time:, name:)
    @post = post
    @time = time
    @name = name
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    all = connection.exec('SELECT * FROM peeps');
    all.map do |peep|
      Peep.new(post: peep['post'], time: peep['time'], name: peep['name'])
    end
  end

  def self.add(post:, time:, name:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (post, time, name) VALUES ('#{post}', '#{time}', '#{name}') RETURNING post, time, name")
    Peep.new(post: result[0]['post'], time: result[0]['time'], name: result[0]['name'])
  end
end
