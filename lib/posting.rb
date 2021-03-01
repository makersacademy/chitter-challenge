require 'pg'

class Posts
  attr_reader :username, :post, :time

 def initialize(username:, post:, time:)
   @username = username
   @post = post
   @time = time
 end

  def self.create(username:, post:)
    connection = PG.connect(dbname: 'Chitter')
    connection.exec("INSERT INTO posts (username, post, time) VALUES('#{username}', '#{post}', current_timestamp);")
  end
  def self.all
    connection = PG.connect(dbname: 'Chitter')
    result = connection.exec("SELECT username,post,time FROM posts;")
     result.reverse_each.map do |chitter|
    Posts.new(username: chitter['username'], post: chitter['post'], time: chitter['time'])
    end
  end
end
