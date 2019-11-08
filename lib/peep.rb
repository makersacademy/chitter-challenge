


class Peep
  attr_reader :time, :title, :body, :username

  def initialize(title, body, username)
    @time = Time.now
    @title = title
    @body = body
    @username = username
  end

  def self.get
    @posts = DBhelper.select
    posts_arr = []
    @posts.each do |post|
      title= post[:title]
      body = post[:body]
      username = post[:username]
      time = post[:time]
      post = Post.new(title,body,username,time)
      posts_arr << post
    end
  end

  class Post
    def initialize(title, body, username, time)
      @title = title
      @body = body
      @username = username
      @time = time
    end
  end
end
