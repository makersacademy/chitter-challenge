class Chitter
  def self.add(peep)
    peep
  end

  def self.all
    # ["how are you?", "Let us discuss"]
    result = DatabaseConnection.query("SELECT * FROM peeps;", [])
   
    result.map {|peep|  
     peep['peep']
    }
  end
end
