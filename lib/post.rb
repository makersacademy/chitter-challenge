require 'pg'

class Post

  attr_reader :id, :username, :content, :posted_at

  def initialize(id:, username:, content:, posted_at:)
    @id = id
    @username = username
    @content = content
    @posted_at = posted_at
  end

  def self.all
    connect_database_environment
    result = @connection.exec("SELECT * FROM post;")
    result.map do |post| 
      Post.new(id: post['id'], username: post['username'],content: post['content'],posted_at: post['posted_at'])
    end
  end

  def self.create(username:, content:, posted_at:)
    connect_database_environment
    r = @connection.exec_params("INSERT INTO post(content,posted_at,username) VALUES($1, $2, $3) RETURNING id, content, posted_at, username", [content, posted_at, username])
    Post.new(id: r[0]['id'], username: r[0]['username'], content: r[0]['content'], posted_at: r[0]['posted_at'])
  end

  def self.connect_database_environment
    if ENV['ENV'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')     
    end
  end

end
