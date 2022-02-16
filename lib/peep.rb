class Peep 

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_at DESC")
    result.map { |peep| peep['peep'] }
  end

  def self.find_by_id(id)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{id}") 
    result.map { |peep| peep['peep'] }.first
  end

  def self.create(peep)
    escaped_peep = DatabaseConnection.escape_string(peep)
    result = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES ('#{escaped_peep}') RETURNING id") 
    result.map { |id| id['id'] }.first
  end

end