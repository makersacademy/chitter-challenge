require_relative 'database_connection'

class Peep 
  attr_reader :contents, :time, :id

  def initialize(contents:, time:, id:)
    @contents = contents
    @time = time 
    @id = id
  end 

  def self.add(contents: )
   time = Time.new.strftime("%Y-%m-%d %H:%M:%S")
    result = DatabaseConnection.query(
      "INSERT INTO peeps (contents, time) VALUES ($1, $2) RETURNING id, contents, time;", [contents, time]
    )
    Peep.new(id: result[0]['id'], contents: result[0]["contents"], time: result[0]["time"])
  end 

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep| 
      Peep.new( 
        contents: peep['contents'], 
        time: peep["time"],
        id: peep['id']
      )
     end 
  end

  def self.delete(id: )
    DatabaseConnection.query("DELETE FROM peeps WHERE id = $1", [id])
  end


    
end 
