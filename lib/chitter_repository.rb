require_relative '../lib/chitter'

class ChitterRepository

  def all
    
    sql = 'SELECT id, peep, created_at FROM chitters;'
    result_set = DatabaseConnection.exec_params(sql, [])

    chitters = []

    result_set.each do |record|
      chitter = Chitter.new

      chitter.id = record['id'].to_i
      chitter.peep = record['peep']
      chitter.created_at = Time.parse(record['created_at'])

      
      chitters << chitter
    end

    return chitters.reverse
  end

  def create(chitter)
    sql = 'INSERT INTO chitters (peep, created_at) VALUES($1, $2);'
    params = [chitter.peep, chitter.created_at]
    record = DatabaseConnection.exec_params(sql, params)

    return nil
  end
end