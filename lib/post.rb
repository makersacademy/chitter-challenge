require 'pg'

class Post
  def self.all
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end

    result = con.exec("SELECT * FROM posts;")
    result.map { |post| post['chit'] }
  end

  def self.create(chit:)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect :dbname => 'chitter_test'
    else
      con = PG.connect :dbname => 'chitter'
    end
    con.exec("INSERT INTO posts (chit) VALUES('#{chit}')")
  end
end
