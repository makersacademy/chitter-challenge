class Diary
  #@@list = []

  def self.all
    database_send("SELECT title, date FROM peeps ORDER BY date")
    #@@list
  end

  def initialize
    #@@list << self
  end
  
end


#
# DATABASE CONNECT CODE BELOW (OUTSIDE CLASS)
#

def connect_to_db

  user = 'postgres'
  password = '123'

  if ENV['ENVIRONMENT'] == 'test'
    PG.connect(dbname: 'chitter_test', :user => user, :password => password )
  else
    PG.connect(dbname: 'chitter', :user => user, :password => password )
  end

end

def database_send(input)

  rs = connect_to_db.exec(input)
  rs.map { |peep| {:url => bookmark['url'], :title => bookmark['title']} }

end
