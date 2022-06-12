require 'pg'

class Peep

  def self.all
    Peep.choose_database
    result = @controller.exec ("SELECT * FROM peeps")
    result.map { |rows| rows.values_at('post', 'time') }.reverse
  end

  def self.add(post, time)
    @new_post = Peep.double_apostrophe(post)
    post_time = time.now.strftime("%k:%M")
    Peep.choose_database
    @controller.exec (
      %$INSERT INTO peeps(post, time) VALUES('#{@new_post}', '#{post_time}') returning post;$
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
  
#time.strftime("%k:%M")