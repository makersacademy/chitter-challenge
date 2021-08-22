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
    # returns array of posts f
    # currently returning hashs, we want strings 
    arr = []
    result = @db_connect.exec ( "SELECT posts FROM cheets")
    result.each do |post| 
      arr << post["posts"]
    end
  p arr 
  p "WE ARE HERE"
  arr
  end 

  # happy with this method 
  def create(post)
    @db_connect.exec( "INSERT INTO cheets(posts) VALUES('#{post}');" ) 
  end 

end 