require 'pg'

class Peep

  def self.all
    Peep.choose_database
    result = @controller.exec ("SELECT * FROM peeps")
    result.map { |rows| rows['post'] }
  end

  def self.add(post)
    @new_post = Peep.double_apostrophe(post)
    Peep.choose_database
    @controller.exec (
      %$INSERT INTO peeps(post) VALUES('#{@new_post}') returning post;$
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
  