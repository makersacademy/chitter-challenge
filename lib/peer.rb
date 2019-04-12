require_relative "./database_connection.rb"

class Peer
  attr_reader :id, :user_id, :content, :date_published
  def self.all
    #  TIMESTAMP WITH TIME ZONE date_published AT TIME ZONE 'Europe/London'
    peers = DatabaseConnection.query("SELECT id, user_id, content,
       date_trunc('second', date_published) AS date_published
      FROM peers ORDER BY date_published DESC;")
    peers.map do |peer|
      Peer.new(
        id: peer['id'],
        user_id: peer['user_id'],
        content: peer['content'],
        date_published: peer['date_published']
      )
    end
  end

  def self.create(user_id:, content:)
    result = DatabaseConnection.query("INSERT INTO peers (user_id, content)
      VALUES('#{user_id}', '#{content}')
      RETURNING *;")
      # id, content, user_id, date_published
    Peer.new(id: result[0]['id'], content: result[0]['content'],
        user_id: result[0]['user_id'], date_published: result[0]['date_published'])
  end


  private

  def initialize(id:, user_id:, content:, date_published:)
    @id = id
    @user_id = user_id
    @content = content
    @date_published = date_published
  end
end
