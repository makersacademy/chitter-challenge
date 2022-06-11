require 'pg'

class Peep
  attr_accessor :post
  def initialize(post)
    @post = post
    @new_post = double_apostrophe
    @controller = PG.connect :dbname => 'chitter'
    @controller.exec ("TRUNCATE TABLE peeps")
    @controller.exec (
      %$INSERT INTO peeps(post) VALUES('#{@new_post}') returning post;$
      )
  end

  def post
    result = @controller.exec ("SELECT post FROM peeps")
    result.map {|rows| rows['post']}
  end

  def double_apostrophe()
    chars = @post.split("")
    new_chars = []
    chars.each do |char|
      char = "''" if char == "'"
      new_chars << char
    end
    p new_chars
    p new_chars.join("")
  end        
  
end

  