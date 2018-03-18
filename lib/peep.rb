require 'pg'

class Peep

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| peep['message'] }
  end

  def self.create(options)
    DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{options[:message]}')")
  end
end
