require_relative 'peep'

class PeepRepository

  def all

    peeps = []

    sql = 'SELECT id, content, created_datetime, maker_id, conversation_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql,[])
    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.content = record['content']
      peep.created_datetime = record['created_datetime']
      peep.maker_id = record['maker_id'].to_i
      peep.conversation_id = record['conversation_id'].to_i
      peeps << peep
    end
    return peeps
  end

  def create(peep)

    sql = 'INSERT INTO peeps (content, maker_id, conversation_id) VALUES ($1, $2, $3);'
    params = [peep.content,peep.maker_id, peep.conversation_id]
    DatabaseConnection.exec_params(sql,params)
    return nil
  end

  def find(id)
    sql = 'SELECT id, content, created_datetime, maker_id, conversation_id FROM peeps WHERE id = $1;'
    params = [id]
    record = DatabaseConnection.exec_params(sql,params).first
    peep = Peep.new
    peep.id = record['id'].to_i
    peep.content = record['content']
    peep.created_datetime = record['created_datetime']
    peep.maker_id = record['maker_id'].to_i
    peep.conversation_id = record['conversation_id'].to_i
    return peep
  end

  def delete(id)
    sql = 'DELETE FROM peeps WHERE id = $1'
    params = [id]
    DatabaseConnection.exec_params(sql,params)
    return nil
  end

end
