require_relative 'database_connection'

class Peep

  attr_reader :string, :timestamp

  def initialize(string)
    @string = string
    @timestamp = Time.now
  end

  def self.create(string)
    DatabaseConnection.query("INSERT INTO peeps (string) VALUES ('#{string}');")
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |row|
      Peep.new(row['string'])
    end
  end

end
