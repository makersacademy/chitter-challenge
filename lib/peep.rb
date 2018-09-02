require_relative 'database_connection'

class Peep
  attr_reader :text

  def self.all
    rs = DatabaseConnection.query("SELECT * FROM peeps")
    rs.map{ |peep| Peep.new(peep['comment']) }
  end

  def self.create(text)
    rs = DatabaseConnection.query("INSERT INTO peeps (comment) VALUES ('#{text}') RETURNING id, comment, user_id, time;")
    Peep.new(rs[0]['comment'])
  end

  def initialize(text)
    @text = text
  end
end
