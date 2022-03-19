require 'pg'

class Chitter

  # def initialize(post:)
  #   @post = post
  # end
    
  def self.create(post:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO chitter_posts (post) VALUES ('#{post}')")
  # Chitter.new(post: result[0]['post'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("SELECT post FROM chitter_posts")
    @messages = result.map do |row| 
      # Chitter.new(post: row['post'])
      row['post']
    end
  end
end
