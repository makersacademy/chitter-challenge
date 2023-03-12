require 'maker'

class MakerRepository
  def create(maker)
    sql = 'INSERT INTO makers (email, password, name, username) VALUES ($1, $2, $3, $4);'
    DatabaseConnection.exec_params(sql, [maker.email, maker.password, maker.name, maker.username])

    return maker
  end

  def find(id)
    sql = 'SELECT id, email, password, name, username FROM makers WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])
    return nil if result_set.num_tuples.zero?
    maker = Maker.new
    maker.id = result_set[0]['id'].to_i
    maker.email = result_set[0]['email']
    maker.password = result_set[0]['password']
    maker.name = result_set[0]['name']
    maker.username = result_set[0]['username']

    return maker
   end

end