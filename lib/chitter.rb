require 'pg'

class Chitter
  def self.all
    begin
      if ENV['RACK_ENV'] == 'test'
        con = PG.connect(:dbname => 'chitter_fake')
      else
        con = PG.connect(:dbname => 'chitter')
      end

      rs = con.exec("SELECT * FROM chitter_posts")

      post_order = rs.map { |posts| posts['post'] }
      p post_order.reverse()

    end
  end

  def self.create(posts:)
    if ENV['RACK_ENV'] == 'test'
      con = PG.connect(:dbname => 'chitter_fake')
    else
      con = PG.connect(:dbname => 'chitter')
    end

    rs = con.exec("INSERT INTO chitter_posts (post) VALUES('#{posts}') RETURNING id, post")
  end
end
