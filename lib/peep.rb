require 'pg'

class Peep
  attr_reader :date, :content, :userID
  
  def initialize(date, content, userID)
    @date = date
    @content = content
    @userID = userID
  end


  def self.all
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peep| 
    Peep.new(peep['date'], peep['content'], peep['userID'])
    }
  end


  def self.add(date, content, userID)
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("INSERT INTO peeps (date, content, userID) VALUES ('#{date}','#{content}','#{userID}') RETURNING date, content, userID;")
    result[0]
    Peep.new(result[0]['date'], result[0]['content'], result[0]['userID'])
  end
end