class Peep 

  def self.find_by_id(id)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{id}") 
    result.map { |peep| peep['peep'] }.first
  end

  def self.create(peep)
    result = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES ('#{peep}') RETURNING id") 
    result.map { |id| id['id'] }.first
  end
end