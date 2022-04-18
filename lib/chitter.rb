class Chitter
  
  # def self.new(id,peep,time)
  #   @id = id
  #   @peep = peep
  #   @time = time
  # end

  def self.create(peep:)
    time1 = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    DatabaseConnection.query("INSERT INTO peeps(peep, time) VALUES($1, $2);", [peep, time1])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps", [])
    result.map {|peep| 
      peep['peep']
      }   
  end
end
