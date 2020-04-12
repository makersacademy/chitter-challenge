require 'pg'

class Peep

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")

    result.map { |peep| peep['content'] }
  end

  def self.create(content:)
    result = DatabaseConnection.query("INSERT INTO peeps (content) VALUES('#{content}')")
  end

end
