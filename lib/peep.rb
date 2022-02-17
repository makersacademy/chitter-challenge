
class Peep 

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_at DESC")
    result.map do |peep| 
      Peep.new(id: peep['id'], peep: peep['peep'], created_at: peep['created_at'])
    end
  end

  def self.find_by_id(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{id}") 
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], created_at: peep['created_at'])
    end.first
  end

  def self.create(peep:)
    escaped_peep = DatabaseConnection.escape_string(peep)
    query = "INSERT INTO peeps (peep) VALUES ('#{escaped_peep}') RETURNING id, peep, created_at"
    result = DatabaseConnection.query(query) 
    result.map do 
      |peep| Peep.new(id: peep['id'], peep: peep['peep'], created_at: peep['created_at'])
    end.first
  end

  attr_reader :id, :peep, :created_at

  def initialize(id:, peep:, created_at:)
    @id = id
    @peep = peep
    @created_at = DateTime.parse(created_at).strftime("%d/%m/%Y %I:%M %p")
  end
  
end
