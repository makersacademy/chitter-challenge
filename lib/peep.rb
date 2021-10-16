require_relative 'database_connection'

class Peep 
  attr_reader :contents, :time

  def initialize(contents:, time: )
    @contents = contents
    @time = time 
  end 

  def self.add(contents: )
    time = Time.new
    result = DatabaseConnection.query(
      "INSERT INTO peeps (contents, time) VALUES ($1, $2) RETURNING contents, time;", [contents, time]
    )
    Peep.new(contents: result[0]["contents"], time: result[0]["time"])
  end 

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep| 
      Peep.new( 
        contents: peep['contents'], 
        time: peep['time']
      )
     end 
  end
    


end 
