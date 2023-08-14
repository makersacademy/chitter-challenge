require_relative '../lib/chitter'
require 'date'

class ChitterRepository

  def all
    
    sql = 'SELECT id, peep, created_at, user_id FROM chitters;'
    result_set = DatabaseConnection.exec_params(sql, [])

    chitters = []

    result_set.each do |record|
      chitter = Chitter.new

      chitter.id = record['id'].to_i
      chitter.peep = record['peep']
      chitter.created_at = DateTime.parse(record['created_at']).to_time
      chitter.user_id = record['user_id'].to_i

      
      chitters << chitter
    end

    return chitters.reverse
  end

  def create(chitter)
    sql = 'INSERT INTO chitters (peep, created_at, user_id) VALUES($1, $2, $3);'
    params = [chitter.peep, chitter.created_at, chitter.user_id]
    record = DatabaseConnection.exec_params(sql, params)

    return nil
  end
end