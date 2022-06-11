require 'pg'

class Peep
  attr_accessor :post
  def initialize(text)
    @controller = PG.connect :dbname => 'chitter'
    @controller.exec ("TRUNCATE TABLE peeps")
    @controller.exec (
      %$INSERT INTO peeps(post) VALUES('#{text}') returning post;$
      )
  end

  def post
    result = @controller.exec ("SELECT post FROM peeps")
    result.map {|rows| rows['post']}
  end
end
