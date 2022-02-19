
class Peep 

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_at DESC")
    result.map do |peep| 
      Peep.new(id: peep['peep_id'], peep: peep['peep'], created_at: peep['created_at'], 
user_id: peep['user_id'], parent_peep_id: peep['parent_peep_id'])
    end
  end

  def self.find_by_id(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE peep_id = #{id}") 
    result.map do |peep|
      Peep.new(id: peep['peep_id'], peep: peep['peep'], created_at: peep['created_at'], 
user_id: peep['user_id'], parent_peep_id: peep['parent_peep_id'])
    end.first
  end

  def self.create(peep:, user_id:, parent_peep_id:)
    return nil if peep.empty?
    escaped_peep = DatabaseConnection.escape_string(peep)
    query = "INSERT INTO peeps (peep, user_id, parent_peep_id) VALUES ('#{escaped_peep}', #{user_id}, CAST(NULLIF('#{parent_peep_id}','') AS INTEGER)) RETURNING peep_id, peep, created_at, user_id, parent_peep_id"
    result = DatabaseConnection.query(query) 
    result.map do 
      |peep| Peep.new(
        id: peep['peep_id'], peep: peep['peep'], 
        created_at: peep['created_at'], user_id: peep['user_id'], 
        parent_peep_id: peep['parent_peep_id'])
    end.first
  end

  attr_reader :id, :peep, :created_at, :user_id, :parent_peep_id

  def initialize(id:, peep:, created_at:, user_id:, parent_peep_id:)
    @id = id
    @peep = peep
    @created_at = DateTime.parse(created_at).strftime("%d/%m/%Y %I:%M %p")
    @user_id = user_id
    @parent_peep_id = parent_peep_id
  end
  
end
