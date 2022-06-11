require 'pg'

class Peep

  def self.all
    if ENV['RACK_ENV'] == 'test'
      @controller = PG.connect :dbname => 'chitter_test'
    else
      @controller = PG.connect :dbname => 'chitter'
    end
    result = @controller.exec ("SELECT * FROM peeps")
    result.map { |rows| rows['post'] }
  end

  def initialize(post)
    @post = post
    @new_post = double_apostrophe
    choose_database
    @controller.exec ("TRUNCATE TABLE peeps")
    @controller.exec (
      %$INSERT INTO peeps(post) VALUES('#{@new_post}') returning post;$
      )
  end

  def post
    result = @controller.exec ("SELECT post FROM peeps")
    result.map { |rows| rows['post'] }
  end

  def double_apostrophe
    chars = @post.chars
    new_chars = []
    chars.each do |char|
      char = "''" if char == "'"
      new_chars << char
    end
    new_chars.join
  end

  def choose_database
    if ENV['RACK_ENV'] == 'test'
      @controller = PG.connect :dbname => 'chitter_test'
    else
      @controller = PG.connect :dbname => 'chitter'
    end
  end
  
end
  