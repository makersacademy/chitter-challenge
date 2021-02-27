require 'pg'

class Posts
  attr_reader :username, :post

  def initialize(username:, post:)
   @username = username
   @post = post
 end
  def self.create(username:, post:)
    connection = PG.connect(dbname: 'Chitter')
    connection.exec("INSERT INTO posts (username, post) VALUES('#{username}', '#{post}');")
  end
  def self.all
    connection = PG.connect(dbname: 'Chitter')
    result = connection.exec("SELECT * FROM posts;")
     result.reverse_each.map do |chitter|
    Posts.new(username: chitter['username'], post: chitter['post'])
    end
  end
end
