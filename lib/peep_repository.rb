require_relative './peep'

class PeepRepository
  def all
    peeps = []

    sql = "SELECT * FROM peeps;"
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |record|
      peep = Peep.new
      peep.id = record["id"].to_i
      peep.message = record["message"]
      peep.time = record["time"]
      peep.user_id = record["user_id"]

      peeps << peep
    end
    return peeps
  end

  def find(id)
    sql = "SELECT * FROM peeps WHERE id = $1;"
    result_set = DatabaseConnection.exec_params(sql, [id])

    peep = Peep.new
    peep.id = result_set[0]["id"].to_i
    peep.message = result_set[0]["message"]
    peep.time = result_set[0]["time"]
    peep.user_id = result_set[0]["user_id"]

    return peep
  end

  def create(peep)
    sql = "INSERT INTO peeps (message, time, user_id) VALUES ($1, $2, $3);"
    result_set =
      DatabaseConnection.exec_params(
        sql,
        [peep.message, peep.time, peep.user_id],
      )

    return peep
  end

end
