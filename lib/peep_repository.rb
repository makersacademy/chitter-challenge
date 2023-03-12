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
