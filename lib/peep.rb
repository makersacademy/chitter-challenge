
class Peep 

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY created_at DESC")
    result.map do |peep| 
      Peep.new(id: peep['id'], peep: peep['peep'], created_at: peep['created_at'], user_id: peep['user_id'])
    end
  end

  def self.find_by_id(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{id}") 
    result.map do |peep|
      Peep.new(id: peep['id'], peep: peep['peep'], created_at: peep['created_at'], user_id: peep['user_id'])
    end.first
  end

  def self.create(peep:, user_id:)
    return nil if peep.empty?
    escaped_peep = DatabaseConnection.escape_string(peep)
    query = "INSERT INTO peeps (peep, user_id) VALUES ('#{escaped_peep}', #{user_id}) RETURNING id, peep, created_at, user_id"
    result = DatabaseConnection.query(query) 
    result.map do 
      |peep| Peep.new(id: peep['id'], peep: peep['peep'], created_at: peep['created_at'], user_id: peep['user_id'])
    end.first
  end

  attr_reader :id, :peep, :created_at, :user_id

  def initialize(id:, peep:, created_at:, user_id:)
    @id = id
    @peep = peep
    @created_at = DateTime.parse(created_at).strftime("%d/%m/%Y %I:%M %p")
    @user_id = user_id
  end
  
end
