require 'pg'

class Chitter
  attr_reader :post

  def initialize(post:)
    @post = post
  end
    
  def self.create(post:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec(
      "INSERT INTO chitter_posts (post) 
      VALUES ('#{post}') 
      RETURNING post;"
    )

    Chitter.new(post: result[0]["post"])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    p result = connection.exec("SELECT post FROM chitter_posts")
    messages = result.map do |row| 
      Chitter.new(post: row["post"])
    end
    messages.reverse
  end
end
