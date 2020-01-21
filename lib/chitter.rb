class Chitter
  attr_reader :peep

  def initialize(peep = '')
    @peep = peep
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |row| row['peep'] }
  end

  def self.post(peep)
    DatabaseConnection.query("INSERT INTO peeps (peep) VALUES('#{peep}');")
  end
end
