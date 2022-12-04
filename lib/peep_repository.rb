require_relative "peep"

class PeepRepository
  def all
    sql = "SELECT id, contents, time, account_id FROM peeps;"
    result_set = DatabaseConnection.exec_params(sql, [])

    peeps = []
    result_set.each do |record|
      peeps << unpack_record(record)
    end
    return peeps
  end

  def find(id)
    sql = "SELECT id, contents, time, account_id FROM peeps WHERE id = $1;"
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)
    record = result_set[0]
    return unpack_record(record)
  end

  def create(peep)
    sql = 'INSERT INTO peeps (contents, time, account_id) VALUES ($1, $2, $3);'
    params = [peep.contents, peep.time, peep.account_id]
    DatabaseConnection.exec_params(sql, params)
    return nil
  end

  def delete(id)
    sql = 'DELETE FROM peeps WHERE id = $1;'
    params = [id]
    DatabaseConnection.exec_params(sql, params)
    return nil
  end

  def update(peep)
    sql = 'UPDATE peeps SET contents = $1, time = $2, account_id = $3 WHERE id = $4;'
    params = [peep.contents, peep.time, peep.account_id, peep.id]
    DatabaseConnection.exec_params(sql, params)
    return nil
  end

  private

  def unpack_record(record)
    peep = Peep.new
    peep.id = record["id"].to_i
    peep.contents = record["contents"]
    peep.time = record["time"]
    peep.account_id = record["account_id"].to_i
    return peep
  end
end