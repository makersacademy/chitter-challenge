require_relative "peep"

class PeepRepository
  def all
    sql = "SELECT * FROM peeps;"
    result_set = DatabaseConnection.exec_params(sql, [])

    peeps = map_records_to_peep_objects(result_set)
  end

  def find_by_username(username)
    sql = "WITH id AS (SELECT user_id FROM users WHERE username = $1) SELECT * FROM peeps WHERE user_id = (SELECT user_id FROM id);"
    result_set = DatabaseConnection.exec_params(sql, [username])

    peeps = map_records_to_peep_objects(result_set)

    peeps.size == 1 ? peeps[0] : peeps
  end

  private

  def map_records_to_peep_objects(records)
    peeps = []

    records.each do |record|
      peep = Peep.new
      peep.peep_id = record["peep_id"]
      peep.content = record["content"]
      peep.created = record["created"]
      peep.updated = record["updated"]
      peep.user_id = record["user_id"]

      peeps << peep
    end

    peeps
  end
end
