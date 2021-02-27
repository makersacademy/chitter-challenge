class Peep

  attr_reader :id, :peep

  def initialize(id:, peep:)
    @id = id
    @peep = peep
  end

  def self.create(peep:)
    result = DatabaseConnection.query("INSERT INTO peeps (peep) VALUES('#{peep}') RETURNING id, peep;")
    Peep.new(id: result[0]['id'], peep: result[0]['peep'])
  end

  def self.all
    result = DatabaseConnection.query('SELECT * FROM peeps')
    @peep_list = result.map do |peep|
      Peep.new(
        peep: peep['peep'],
        id: peep['id']
      )
    end
  end

  def self.reverse
    @peep_list.reverse
  end
end
