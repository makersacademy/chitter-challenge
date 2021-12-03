require_relative 'database_connection'

class Chitter
  
  def self.all
    result = DatabaseConnection.query("SELECT * FROM chitter;")

    result.map do |chitter|
      Chitter.new(id: result[0]['id'], post: chitter['post'], time: chitter['time'])
    end 
   
  end 

  def self.create(post:)
    result = DatabaseConnection.query("INSERT INTO chitter (post) VALUES('#{post}') RETURNING post")

    Chitter.new(id: result[0]['id'], post: result[0]['post'], time: result[0]['time'])
  end 
  
  attr_reader :id, :post, :time 

  def initialize(id:, post:, time:) 
    @id = id
    @post = post
    @time = time
  end

end
