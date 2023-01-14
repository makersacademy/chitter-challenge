require 'peep'

class PeepRepository

  def all
    all_peeps = []
    sql = 'SELECT * FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |entry|
      all_peeps << peep_inflate(entry)
    end
    return all_peeps
  end

  def find(id)
    single_peep = []
    sql = 'SELECT * FROM peeps WHERE id = $1;'
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    entry = result_set[0]
      single_peep << peep_inflate(entry)
    return single_peep #or delete line above and use this instead: return peep_inflate(entry)
  end

  def create(peep)
    sql = 'INSERT INTO peeps (peep_content, peep_date, user_id) VALUES ($1, $2, $3);'
    sql_params = [peep.peep_content, peep.peep_date, peep.user_id]
    DatabaseConnection.exec_params(sql, sql_params)
  end

  def delete(id)
    sql = 'DELETE FROM peeps WHERE id = $1;'
    sql_params = [id]
    DatabaseConnection.exec_params(sql, sql_params)
  end


  private 

  def peep_inflate(entry)
    peep = Peep.new
    peep.id = entry["id"].to_i
    peep.peep_content = entry['peep_content']
    peep.peep_date = entry['peep_date']
    return peep
  end

end
