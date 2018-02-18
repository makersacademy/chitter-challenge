require_relative 'database_connection'

class Peep

  attr_reader :string, :date_created

  def initialize(string, date_created)
    @string = string
    @date_created = date_created
  end

  def self.create(string)
    DatabaseConnection.query("INSERT INTO peeps (string, datecreated) VALUES ('#{string}', '#{Time.now}');")
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY datecreated DESC;")
    result.map do |row|
      Peep.new(row['string'], row['datecreated'])
    end
  end

end
