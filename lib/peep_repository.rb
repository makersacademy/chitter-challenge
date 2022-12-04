require_relative "../lib/peep"
require_relative "../spec/user_repository_spec"
require_relative "../lib/user"
require_relative "../lib/database_connection"


class PeepRepository
  def all
    all_peeps = []

    sql = "SELECT id, content, created, user_id FROM peeps;"
    result_set = DatabaseConnection.exec_params(sql, [])

    all_peeps = []

    result_set.each do |record|
      peep = Peep.new
      peep.id = record["id"]
      peep.content = record["content"]
      peep.created = record["created"]
      peep.user_id = record["user_id"]
      all_peeps << peep
    end
    return all_peeps
  end

  def create(peep)
    sql = "INSERT INTO peeps (content, created, user_id) VALUES ($1, $2, $3);"
    sql_params = [peep.content, peep.created, peep.user_id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    return peep
  end


  def find(id)
    sql = "SELECT id,content,created,user_id FROM peeps WHERE id = $1;"
    sql_params = [id]

    result_set = DatabaseConnection.exec_params(sql, sql_params)
    record = result_set[0]

    user_in_question = Peep.new
    user_in_question.id = record["id"]
    user_in_question.content = record["content"]
    user_in_question.created = record["created"]
    user_in_question.user_id = record["user_id"]
    return user_in_question
  end
end
