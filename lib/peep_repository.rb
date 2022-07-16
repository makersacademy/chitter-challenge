require 'peep'

class PeepRepository

  def all
    sql = "SELECT id, content, date, user_id FROM peeps;"
    result_set = DatabaseConnection.exec_params(sql, [])
    convert(result_set)
  end

  def find(id)
    sql = "SELECT id, content, date, user_id FROM peeps WHERE id=$1;"
    result_set = DatabaseConnection.exec_params(sql, [id])
    convert(result_set)
  end

  def create(peep)
    sql = "INSERT INTO peeps(content, date, user_id) VALUES($1, $2, $3);"
    params = [peep.content, peep.date, peep.user_id]
    DatabaseConnection.exec_params(sql, params)
  end

  def delete(id)
    sql = "DELETE FROM peeps WHERE id=$1;"
    DatabaseConnection.exec_params(sql, [id])
  end

  private

  def convert(result_set)
    peeps = []
    result_set.each do |record|
      peep = Peep.new
      peep.id = record["id"].to_i
      peep.content = record["content"]
      peep.date = record["date"]
      peep.user_id = record["user_id"].to_i
      peeps << peep
    end
    peeps
  end


end