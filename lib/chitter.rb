class Chitter
  attr_reader :peep, :created_at

  def initialize(peep, created_at)
    @peep = peep
    @created_at = DateTime.parse(created_at)
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |row| Chitter.new(row['peep'], row['created_at']) }
  end

  def self.post(peep)
    DatabaseConnection.query("INSERT INTO peeps (peep) VALUES('#{peep}');")
  end
end
