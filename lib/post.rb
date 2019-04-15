require 'pg'

class Post
  attr_reader :post, :time
  def initialize(post, time)
    @post = post
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM posts;")
    result.map do |post|
      Post.new(post["post"], post["time"])
    end
  end

  def self.create(post:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    time = Time.now.strftime("%c")
    connection.exec("INSERT INTO posts (post, time) VALUES('#{post}', '#{time}')")
  end
end
