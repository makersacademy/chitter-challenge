
class Peep 

  attr_reader :id, :peep, :created_at

  def initialize(id, peep, created_at)
    @id = id
    @peep = peep
    @created_at = DateTime.parse(created_at).strftime("%d/%m/%Y %I:%M %p")
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_at DESC")
    result.map do |peep| 
      Peep.new(peep['id'], peep['peep'], peep['created_at'])
    end
  end

  def self.find_by_id(id)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{id}") 
    result.map { |peep| Peep.new(peep['id'], peep['peep'], peep['created_at']) }.first
  end

  def self.create(peep)
    escaped_peep = DatabaseConnection.escape_string(peep)
    result = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES ('#{escaped_peep}') RETURNING id, peep, created_at") 
    result.map { |peep| Peep.new(peep['id'], peep['peep'], peep['created_at']) }.first
  end


end
