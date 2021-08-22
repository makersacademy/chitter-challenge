class Cheet 

  attr_reader :db_conn
  
  def initialize
    if ENV['RACK_ENV'] == 'test'
      @db_conn = PG.connect(dbname: 'chitter_test')
    else 
      @db_conn = PG.connect(dbname: 'chitter')
    end 
  end 

  def all 
    # currently returning arrays, would possibly change to passing instances ?  
    arr = []
    result = @db_conn.exec("SELECT * FROM cheets")
    result.each do |post| 
      arr << [post["posts"], post["date"], post["time"]]
    end
    arr
  end 

  def create(post)
    # creates time stamp and saves post inside DataBase
    time_stamp = Time.now
    date = time_stamp.strftime("%d/%m/%Y")
    time = time_stamp.strftime("%k:%M")
    @db_conn.exec("INSERT INTO cheets(posts, date, time) VALUES('#{post}', '#{date}', '#{time}');")
  end 
end 
