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

      # post_order = rs.map { |posts,| posts['post'] }
      # p post_order.reverse()
      rs.reverse_each.map do |posts|
        chitter_posts = {:post => posts['post'], :time => posts['time']}
        p chitter_posts
      end
    end
  end

  def self.create(post:, time:)
    begin
      if ENV['RACK_ENV'] == 'test'
        con = PG.connect(:dbname => 'chitter_fake')
      else
        con = PG.connect(:dbname => 'chitter')
      end

      rs = con.exec("INSERT INTO chitter_posts (post, time) VALUES('#{post}', '#{time}') RETURNING id, post, time")
    end
  end
end
