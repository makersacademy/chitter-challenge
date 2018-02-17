require 'pg'

class Peep

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| peep['post'] }
  end

  def self.create(new_peep)
    DatabaseConnection.query("INSERT INTO peeps (post) VALUES('#{new_peep}');")
  end

end
