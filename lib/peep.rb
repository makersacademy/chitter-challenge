require 'pg'
require 'user'

class Peep

  def self.all
    Peep.choose_database
    result = @controller.exec ("SELECT * FROM peeps")
    post_details = result.map { |rows| rows.values_at('username', 'post', 'time') }.reverse
    post_details.each do |peep|
      # extracts the name from the users table
    end
  end

  def self.add(post, time = Time, user = User)
    @new_post = Peep.double_apostrophe(post)
    post_time = time.now.strftime("%k:%M")
    username = user.username
    Peep.choose_database
    @controller.exec (
      %$INSERT INTO peeps(post, username, time) VALUES('#{@new_post}', '#{username}', '#{post_time}') returning post;$
      )
  end

  def self.double_apostrophe(post)
    chars = post.chars
    new_chars = []
    chars.each do |char|
      char = "''" if char == "'"
      new_chars << char
    end
    new_chars.join
  end

  def self.choose_database
    if ENV['RACK_ENV'] == 'test'
      @controller = PG.connect :dbname => 'chitter_test'
    else
      @controller = PG.connect :dbname => 'chitter'
    end
  end
  
end
  