require 'pg'

class Peep

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY time DESC;")
    result.map { |peep| peep['post'] }
  end

  def self.create(new_peep)
    sql = "INSERT INTO peeps (post, time) VALUES('#{new_peep}', 'NOW()');"
    DatabaseConnection.query(sql)
  end

end
