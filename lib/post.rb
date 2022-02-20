require 'pg'

class Post
  def self.all
    connect_database_environment
    result = @connection.exec("SELECT * FROM post;")
    result.map { |post| post['content'] }
  end

  def self.create(content:)
    connect_database_environment
    @connection.exec("INSERT INTO post (content) VALUES('#{content}');")
  end

  def self.connect_database_environment
    if ENV['ENV'] == 'test'
      @connection = PG.connect(dbname: 'chitter_test')
    else
      @connection = PG.connect(dbname: 'chitter')     
    end
  end

end
