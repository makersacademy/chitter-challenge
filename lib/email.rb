class Email 
  
  attr_reader :db_connect
  
  def initialize
    if ENV['RACK_ENV'] == 'test'
      @db_connect = PG.connect(dbname: 'chitter_test')
    else 
      @db_connect = PG.connect(dbname: 'chitter')
    end 
  end 

  def all 
    arr = []
    result = @db_connect.exec ( "SELECT email FROM users")
    result.each do |user| 
      arr << user["email"]
    end
  p arr.join
  end 

  def add(email)
    @db_connect.exec( "INSERT INTO users(email) VALUES('#{email}');" )  
  end 

end 
