require_relative './peep'

class PeepRepository

  def all
    peeps = []

    sql = 'SELECT id, content, created_timestamp, author_id FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql,[])
    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.content = record['content']
      peep.created_datetime = record['created_timestamp']
      peep.author_id = record['author_id'].to_i
      peeps << peep
    end
    return peeps
  end
end