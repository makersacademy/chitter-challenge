require_relative '../lib/chitter'

class ChitterRepository

  def all
    
    sql = 'SELECT id, peep, peep_time FROM chitters;'
    result_set = DatabaseConnection.exec_params(sql, [])

    chitters = []

    result_set.each do |record|
      chitter = Chitter.new

      chitter.id = record['id'].to_i
      chitter.peep = record['peep']
      chitter.peep_time = record['peep_time']

      
      chitters << chitter
    end

    return chitters.reverse
  end

  def create(chitter)
    sql = 'INSERT INTO chitters (peep, peep_time) VALUES($1, $2);'
    params = [chitter.peep, chitter.peep_time]
    record = DatabaseConnection.exec_params(sql, params)

    return nil
  end
end