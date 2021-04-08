require_relative 'database_connection'

class Peep

  attr_reader :id,  :peep, :created_at

  def initialize(id:, peep:, created_at:)
    @id = id
    @peep = peep
    @created_at = created_at
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      # p peep - {"id"=>"575", "peep"=>"Salut!", "created_at"=>"2021-04-07 09:31:51+01"}
      Peep.new(id: peep['id'], peep: peep['peep'], created_at: peep['created_at']) # creates peep objects
    end
    .reverse
  end

  def self.create(peep:, created_at: Time.now)
    result = DatabaseConnection.query("INSERT INTO peeps (peep, created_at) VALUES('#{peep}', '#{created_at}') RETURNING id, peep, created_at")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], created_at: result[0]['created_at'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM peeps WHERE id = #{id}")
  end
  
  def self.update(id:, peep:)
    result = DatabaseConnection.query("UPDATE peeps SET peep = '#{peep}' WHERE id = #{id} RETURNING id, peep")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], created_at: result[0]['created_at'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE id = #{id};")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'], created_at: result[0]['created_at'])
  end

end
