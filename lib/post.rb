require 'pg'

class Post

  attr_reader :id, :chit, :time

  def initialize(id:, chit:, time:)
    @id = id
    @chit = chit
    @time = time
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end

    result = con.exec("SELECT * FROM posts;")
    result.map do |post|
       Post.new(id: post['id'], chit: post['chit'], time: post['time'])
     end
  end

  def self.create(chit:)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end
    result = con.exec("INSERT INTO posts (chit, time) VALUES('#{chit}', 'NOW') RETURNING id, chit, time;")
    Post.new(id: result[0]['id'], chit: result[0]['chit'], time: result[0]['time'])
  end
end
