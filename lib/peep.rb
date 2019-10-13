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

  def self.all
    peeps = DBConnection.query("SELECT * FROM peeps;")
    peeps.reverse_each.map do |peep|
      Peep.new(
        id: peep['id'],
        content: peep['content'],
        timestamp: peep['timestamp'],
        user_id: peep['user_id']
      )
    end
  end

  attr_reader :id, :content, :timestamp, :user_id, :user

  def initialize(id:, content:, timestamp:, user_id:)
    @id = id
    @content = content
    @timestamp = timestamp
    @user_id = user_id
    @user = User.find(by: 'id', term: user_id)
  end

end
