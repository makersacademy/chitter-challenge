class Blab
  attr_reader :id, :timestamp, :content, :user_id

  def initialize(id, timestamp, content, user_id)
    @id = id
    @timestamp = timestamp
    @content = content
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM blabs;")
    result.map do |blab|
      Blab.new(blab['id'], blab['timestamp'], blab['content'], blab['user_id'])
    end
  end

  def self.create(content, user_id)
    result = DatabaseConnection.query("INSERT INTO blabs (content, user_id) VALUES ('#{content}', '#{user_id}') RETURNING id, timestamp, content, user_id;")
    Blab.new(result.first['id'], result.first['timestamp'], result.first['content'], result.first['user_id'])
  end

  def creator
    result = DatabaseConnection.query("SELECT username FROM users WHERE id = #{@user_id};")
    result.first['username']
  end

  def ==(blab)
    @id == blab.id
  end
end
