require "pg"
require "time"
class Post
  def self.create(text, time = Time.now())
    if ENV['ENVIRONMENT']=="test"
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO Post (text,date) VALUES ('#{text}','#{time}');")
  end
end
