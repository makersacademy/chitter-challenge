require "pg"
require "time"
class Post
  attr_reader :id, :text, :date
  def initialize(id,text,date)
    @id = id
    @text = text
    @date = date
  end

  def self.all
    if ENV['ENVIRONMENT']=="test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT * FROM Post ORDER BY date DESC;")
    result.map do |post|
      Post.new(post["id"],post["text"],post["date"])
    end
  end

  def self.create(text, time = Time)
    if ENV['ENVIRONMENT']=="test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO Post (text,date) VALUES ('#{text}','#{time.now}');")
  end
end
