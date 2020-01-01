class Comment

  attr_reader :id, :comment, :time, :message_id, :username

  def initialize(id, comment, time, message_id, username)
    @id = id
    @comment = comment
    @time = time
    @message_id = message_id
    @username = username
  end

  def self.add(username, comment, message_id)
    database_selector
    @connection.exec("INSERT INTO comments(comment, message_id, username)
    VALUES('#{comment}', '#{message_id}', '#{username}')")
  end

  def self.all(message_id)
    database_selector
    result = @connection.exec("SELECT * FROM comments WHERE message_id='#{message_id}' ORDER BY created_at DESC")
    result.map { |comment|
      Comment.new(comment['id'], comment['comment'], comment['created_at'], comment['message_id'], comment['username'])
    }
  end

  def self.database_selector
    if ENV['ENVIRONMENT'] == 'test'
      @connection = PG.connect(dbname: 'message_database_test')
    else
      @connection = PG.connect(dbname: 'message_database')
    end
  end
  
  private_class_method :database_selector

end
