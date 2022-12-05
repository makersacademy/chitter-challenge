require_relative './database_connection'
require_relative './peep'

class PeepRepository

  # Selecting all records
  # No arguments
  def all

    # Executes the SQL query:
    sql = 'SELECT * FROM peeps;'
    results = DatabaseConnection.exec_params(sql,[])

    peeps = []
    results.each do |result|
      peep = format_peep(result)
      peeps << peep
    end
    return peeps
  end

  # Gets a single record by ID
  # One argument: id (number)
  def find(id)
    # Executes the SQL query:
    sql = 'SELECT * FROM peeps WHERE id = $1;'
    params = [id]

    result = DatabaseConnection.exec_params(sql,params)
    peep = format_peep(result[0])

    return peep
  end


  def create(peep)
    # Executes the SQL query:
    sql = 'INSERT INTO peeps (message, time, user_id) VALUES ($1, $2, $3)'
    params = [peep.message, peep.time, peep.user_id]
    DatabaseConnection.exec_params(sql,params)
    return nil
  end

  private

  def format_peep(result)
    peep = Peep.new
    peep.id = result["id"].to_i
    peep.message = result["message"]
    peep.time = result["time"]
    peep.user_id = result["user_id"].to_i
    return peep
  end
end