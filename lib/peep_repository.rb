require "time"
require_relative "./peep"
require_relative "./record_methods"

class PeepRepository

  def all
    sql = 'SELECT * FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])

    peeps = []
    result_set.each do |record|
      peeps << Record.to_peep(record)
    end
    chronologically = peeps.sort_by { |peep| Time.parse(peep.time) }

    return chronologically.reverse
  end

  def find(id)
    sql = 'SELECT * FROM peeps WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])
    result_found = result_set.ntuples.positive?
    return result_found ? Record.to_peep(result_set[0]) : nil
  end

  def create(peep)
    tags = Peep.get_tags(peep.content)
    sql = 'INSERT INTO peeps (time, content, user_id)
            VALUES($1, $2, $3);'
    sql_params = [peep.time, peep.content, peep.user_id]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  def update(peep)
    sql = 'UPDATE peeps SET content = $1 WHERE id = $2;'
    sql_params = [peep.content, peep.id]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  def delete(id)
    sql = 'DELETE FROM peeps WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id])
  end
end
