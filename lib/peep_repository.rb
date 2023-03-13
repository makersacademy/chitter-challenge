require 'database_connection'

class PeepRepository
  def all
    sql = 'SELECT id, peep_content, peep_post_date, user_id FROM peeps;'
    result = DatabaseConnection.exec_params(sql, [])
    peep_list = []
    result.each do |record|
        peep = Peep.new
        peep.peep_content = record['peep_content']
        peep.peep_post_date = record['peep_post_date']
        peep.user_id = record['user_id'].to_i
        peep_list << peep
    end

    return peep_list
  end
  
  def find(id)
    sql = 'SELECT id, peep_content, peep_post_date, user_id FROM peeps WHERE id = $1;'
    result = DatabaseConnection.exec_params(sql, [id]) 
    record = result[0]
    peep = Peep.new
    peep.peep_content = record['peep_content']
    peep.peep_post_date = record['peep_post_date']
    peep.user_id = record['user_id'].to_i
    return peep
  end

  def find_user_peeps(user_id)
    sql = 'SELECT id, peep_content, peep_post_date, user_id FROM peeps WHERE user_id = $1;'
    result = DatabaseConnection.exec_params(sql, [user_id]) 
    peeps_list = []
    result.each do |record|
      peep = Peep.new
      peep.peep_content = record['peep_content']
      peep.peep_post_date = record['peep_post_date']
      peep.user_id = record['user_id'].to_i
      peeps_list << peep
    end
    return peeps_list
  end

  def create(peep)
    sql = 'INSERT INTO peeps (peep_content, peep_post_date, user_id) VALUES ($1, $2, $3);'
    params = [peep.peep_content, peep.peep_post_date, peep.user_id]
    result = DatabaseConnection.exec_params(sql, params)
    return nil
  end
  
  def update(peep)
    sql = 'UPDATE peeps SET peep_content = $1;'
    params = [peep.peep_content]
    result = DatabaseConnection.exec_params(sql, params)
    return nil
  end
  
  def delete_peep(id)
    sql = 'DELETE FROM peeps WHERE id = $1;'
    result = DatabaseConnection.exec_params(sql, [id])
    return nil
  end
  
  def delete_all_peeps(user_id)
    sql = 'DELETE FROM peeps WHERE user_id = $1;'
    result = DatabaseConnection.exec_params(sql, [user_id])
    return nil
  end
end