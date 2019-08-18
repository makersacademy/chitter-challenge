class Post

  attr_reader :msg, :time, :id

  def initialize(msg:, time:, id:)
    @msg = msg
    @time = time
    @id = id
  end

  def self.create(msg:)
    @time = Time.now
    result = DatabaseConnection.query("INSERT INTO posts (msg, timeadded) VALUES('#{msg}', '#{@time}') RETURNING id, msg, timeadded;")
    Post.new(msg: result[0]['msg'], time: result[0]['timeadded'], id: result[0]['id'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM posts")
    result.map do |post|
      Post.new(
        msg: post['msg'],
        time: post['timeadded'],
        id: post['id']
      )
     end
 end
end
