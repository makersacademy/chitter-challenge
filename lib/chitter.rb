require 'pg'

class Chitter

  attr_reader :post, :time 

  def initialize(post:, time:) 
    @post = post
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    result = connection.exec("SELECT * FROM chitter;")

    result.map do |chitter|
      Chitter.new(post: chitter['post'], time: chitter['time'])
      # |chitter| chitter['post']
    end 
    # [
    #   "This is my first Chitter post!",
    #   "This is my second Chitter post!", 
    #   "This is my third Chitter post!"
    # ]
  end 

  def self.create(post:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_app_test')
    else
      connection = PG.connect(dbname: 'chitter_app')
    end

    connection.exec("INSERT INTO chitter (post) VALUES('#{post}')")
  end 
end
