class Peep

  def self.create(content:, user_id:)
    escaped_content = content.gsub("'", "''")
    sql = "INSERT INTO peeps (content, user_id) "
    sql += "VALUES('#{escaped_content}', '#{user_id}') "
    sql += "RETURNING id, content, timestamp, user_id"
    result = DBConnection.query(sql)

    Peep.new(
      id: result[0]['id'],
      content: result[0]['content'],
      timestamp: result[0]['timestamp'],
      user_id: result[0]['user_id']
    )
  end

  attr_reader :id, :content, :timestamp, :user_id

  def initialize(id:, content:, timestamp:, user_id:)
    @id = id
    @content = content
    @timestamp = timestamp
    @user_id = user_id
  end

end
