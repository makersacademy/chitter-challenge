require_relative 'database_connection'

class Peep

  def all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map{ |row| row['peep'] }
  end

  def post_peep(peep, username)
    result = DatabaseConnection.query("INSERT INTO peeps VALUES('#{peep}', 'time', '#{username}')")
  end
end
