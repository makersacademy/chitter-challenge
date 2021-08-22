class Cheet 

  attr_reader :db_connect
  
  def initialize
    if ENV['RACK_ENV'] == 'test'
      @db_connect = PG.connect(dbname: 'chitter_test')
    else 
      @db_connect = PG.connect(dbname: 'chitter')
    end 
  end 


  def all 
    # returns array of posts 
    arr = []
    result = @db_connect.exec ( "SELECT posts FROM cheets")
    result.each do |post| 
      p post
      arr << post["posts"]
    end 
  arr.join(", ")
  end 

  def create(post)
    @db_connect.exec( "INSERT INTO cheets(posts) VALUES('#{post}');" ) 
  end 

end 