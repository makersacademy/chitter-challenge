class Peep
  attr_reader :id, :username, :content, :post_time, :reply_to

  def initialize(id, username, content, post_time, reply_to: nil,
                 connection: DatabaseConnection.new)
    @id = id
    @username = username
    @content = content
    @post_time = time_ago(post_time)
    @connection = connection
    @reply_to = reply?
  end

  def time_ago(post_time)
    post_time
  end

  def reply?
    reply = @connection.query('SELECT users.username, peeps.timestamp, '\
      'replies.original_id from replies INNER JOIN peeps ON '\
      'replies.original_id = peeps.id INNER JOIN users ON peeps.user_id = '\
      "users.id WHERE replies.reply_id = #{@id};")
    @reply_to = reply[0] unless reply.empty?
  end
end
