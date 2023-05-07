require 'chitter'

class ChitterRepository

  # Selecting all records
  # No arguments
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

    return chitters
  end

  def order
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

end