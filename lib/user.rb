require_relative 'database_connection'

class User

  attr_reader :id, :peep, :peeped_at

  def initialize(id:, peep:, peeped_at:)
    @id = id
    @peep = peep
    @peeped_at = peeped_at
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map do |peep|
      User.new(
        id: peep['id'],
        peep: peep['peep'],
        peeped_at: peep['peeped_at']
      )
    end
  end

  def self.create(peep:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep;")
    User.new(id: result[0]['id'], peep: result[0]['peep'], peeped_at: result[0]['peeped_at'])
  end

  # def time
  #   newtime = DatabaseConnection.query("SELECT * FROM peeps WHERE id=1;")
  #   newtime[0]['peeped_at'].to_s
  # end

end
