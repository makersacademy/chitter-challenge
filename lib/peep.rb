require 'pg'

class Peep
  attr_reader :post

  def initialize(post:)
    @post = post
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    all = connection.exec('SELECT post FROM peeps');
    p all.map { |peep| peep['post'] }
  end

  def self.add(post:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (post) VALUES ('#{post}') RETURNING post")
    Peep.new(post: result[0]['post'])
  end
end
