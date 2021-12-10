require_relative 'database_connection'

class Chitter
  
  def self.all
    result = DatabaseConnection.query("SELECT * FROM chitter;")

    result.map do |chitter|
      Chitter.new(
        id: result[0]['id'], 
        post: chitter['post'], 
        time: chitter['time'],
        author_id: chitter['author_id'],
        author_email: chitter['author_email'],
        author_name: chitter['author_name'] 
      )
    end 
   
  end 

  def self.create(post:, author_id:, author_email:, author_name:)
    result = DatabaseConnection.query("INSERT INTO chitter (post, author_id, author_email, author_name) VALUES('#{post}', '#{author_id}', '#{author_email}', '#{author_name}') RETURNING post, author_id, author_email, author_name;")

    Chitter.new(id: result[0]['id'], post: result[0]['post'], time: result[0]['time'], author_id: result[0]['author_id'], author_email: result[0]['author_email'], author_name: result[0]['author_name'])
  end 
  
  attr_reader :id, :post, :time, :author_id, :author_email, :author_name

  def initialize(id:, post:, time:, author_id:, author_email:, author_name:) 
    @id = id
    @post = post
    @time = time
    @author_id = author_id
    @author_email = author_email
    @author_name = author_name
  end

end
