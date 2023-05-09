require_relative './peep'

class PeepRepository

  def all
    query = 'SELECT * FROM peeps;'
    result = DatabaseConnection.exec_params(query, [])

    peeps = []

    result.each do |record|
      peeps << create_peep_object(record)
    end

    return peeps
  end

  def find(id)
    query = 'SELECT * FROM peeps WHERE id = $1;'
    param = [id]

    result = DatabaseConnection.exec_params(query, param)[0]

    return create_peep_object(result)
  end

  def create(peep)
    query = 'INSERT INTO peeps (content, time, user_id) VALUES ($1, $2, $3);'
    params = [peep.content, peep.time, peep.user_id]

    DatabaseConnection.exec_params(query, params)
  end

  private 

  def create_peep_object(record)
    peep = Peep.new
    peep.id = record['id']
    peep.content = record['content']
    peep.time = record['time']
    peep.user_id = record['user_id']

    return peep
  end
end
