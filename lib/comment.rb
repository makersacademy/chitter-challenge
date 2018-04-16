class Comment
  attr_reader :id, :content, :user_id, :peep_id, :time
  def initialize (id, content, user_id, peep_id, time)
    @id = id
    @content = content
    @user_id = user_id
    @peep_id = peep_id
    @time = time
  end

  def self.add(peep, comment, user)
    result = DatabaseConnection.query("INSERT INTO comments(content, user_id, peep_id, time) VALUES('#{comment[:content]}', '#{user.id}' REFERENCES users(id), '#{peep.id} REFERENCES peeps(id)' '#{Time.new.strftime("%H:%M:%S")}') RETURNING *")
    Comment.new(result.first['id'], result.first['content'], result.first['user_id'], result.first['peep_id'], result.first['time'])
  end

end
