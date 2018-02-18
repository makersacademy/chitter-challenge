# require 'pg'
# require 'database_connection'

class Peep
  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| peep['post'] }
  end

  def self.create(options)
    DatabaseConnection.query("INSERT INTO peeps (post) VALUES('#{options[:post]}')")
  end
end
