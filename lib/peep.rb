require_relative 'database_connection'

class Peep
  
  attr_reader :id, :content, :created_at

  def initialize(id:, content:, created_at:)
    @id = id
    @content = content
    @created_at = created_at # automatically get CURRENT TIMESTAMP
  end

  def self.all
    rs = DatabaseConnection.query("SELECT * FROM peeps ORDER BY id DESC;")

    rs.map do |peep_data|  # rs (result object) is NOT A REAL PEEP instance just data entries. we grab these from the database with map
      Peep.new(                                    # use the data entries (rs) to create a Peep
        id: peep_data['id'],
        content: peep_data['content'],
        created_at: (Time.parse(peep_data['created_at'])).strftime(" created at %I:%M%p")  # Takes a string representation of a Time and attempts to parse it
      )
    end
  end

  def self.create(content:)
    rs = DatabaseConnection.query("INSERT INTO peeps (content) VALUES ('#{content}') RETURNING id, content, created_at;") 
    # if not RETURNING etc we get error message that id etc is out of range
    
    Peep.new(                         # use the data entries (rs) to create a Peep
      id: rs[0]['id'],
      content: rs[0]['content'],
      created_at: rs[0]['created_at']
      )
  end
end