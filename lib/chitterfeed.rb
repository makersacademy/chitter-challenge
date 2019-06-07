require 'pg'

class ChitterFeed
  attr_reader :id, :content, :posted_at, :user_id

  def initialize(id, content, posted_at, user_id)
    @id = id
    @content = content
    @posted_at = posted_at
    @user_id = user_id
  end

  def self.add(message, time = Time.new)
    con = if ENV['ENVIRONMENT'] == 'test'
            PG.connect(dbname: 'chitter_test')
          else
            PG.connect(dbname: 'chitter')
          end
    con.exec("INSERT INTO messages (content, postedat) VALUES ('#{message}', '#{time}');")
  end
        
  def self.view
    con = if ENV['ENVIRONMENT'] == 'test'
            PG.connect(dbname: 'chitter_test')
          else
            PG.connect(dbname: 'chitter')
          end
    feed_data = con.exec("SELECT * FROM messages")
    feed_data.map { |message| ChitterFeed.new(message['id'], message['content'], message['postedat'], message['userid']) }
  end
end