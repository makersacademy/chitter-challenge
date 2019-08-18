class Post

  attr_reader :msg, :time, :id

  def initialize(msg:, time:, id:)
    @msg = msg
    @time = time
    @id = id
  end

  def self.create(msg:, time:)

    connection = PG.connect(dbname: 'chitter_test')

    result = connection.exec("INSERT INTO posts (msg, timeadded) VALUES('#{msg}', '#{time}') RETURNING id, msg, timeadded;")

    Post.new(msg: result[0]['msg'], time: result[0]['timeadded'], id: result[0]['id'])

  end

  def self.all

  connection = PG.connect(dbname: 'chitter_test')
  result = connection.exec("SELECT * FROM posts")
  result.map do |post|
    Post.new(
      msg: post['msg'],
      time: post['timeadded'],
      id: post['id']
    )
   end
 end
end
