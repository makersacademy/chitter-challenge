class PeepRepository
  def all
    peeps = []
    sql = "SELECT id, content, created_at, maker_id FROM peeps;"
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |record|
        peep = Peep.new
        peep.id = record['id'].to_i
        peep.content = record['content']
        peep.created_at = record['created_at']
        peep.user_id = record['maker_id'].to_i

        peeps << peep
    end
    return peeps        
  end

  def find(id)
    sql = "SELECT id, content, created_at, maker_id FROM peeps WHERE id = $1;"
    result_set = DatabaseConnection.exec_params(sql_)
  end
end