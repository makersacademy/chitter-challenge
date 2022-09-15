require_relative 'peep'
require_relative 'database_connection'

class PeepRepository
  def all
    peeps = []

    sql = 'SELECT * FROM peeps;'
    result_set = DatabaseConnection.exec_params(sql, [])
    # binding.irb    

    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.content = record['content']
      peep.date_time = record['date_time']
      peep.user_f_name = record['user_f_name']
      peep.user_handle = record['user_handle']
      peeps << peep
    end

    return peeps

  end

#   def find(id)
#     sql = 'SELECT id, name, genre FROM peeps WHERE id = $1;'
#     result_set = DatabaseConnection.exec_params(sql, [id])

#     peep = Peep.new
#     peep.id = result_set[0]['id'].to_i
#     peep.name = result_set[0]['name']
#     peep.genre = result_set[0]['genre']

#     return peep
#   end

#   def create(peep)
#     sql = 'INSERT INTO peeps (name, genre) VALUES ($1, $2);'
#     result_set = DatabaseConnection.exec_params(sql, [peep.name, peep.genre])

#     return peep
#   end
end