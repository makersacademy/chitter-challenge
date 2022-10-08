require_relative 'maker'

class MakerRepository
  def all
    makers = []

    sql = 'SELECT id, name, username, email, password FROM makers;'
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |record|
      maker = Maker.new
      maker.id = record['id'].to_i
      maker.name = record['name']
      maker.username = record['username']
      maker.email = record['email']
      maker.password = record['password']

      makers << maker
    end
    return makers
  end

  def find(id)
    sql = 'SELECT id, name, username, email, password FROM makers WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    maker = Maker.new
    maker.id = result_set[0]['id'].to_i
    maker.name = result_set[0]['name']
    maker.username = result_set[0]['username']
    maker.email = result_set[0]['email']
    maker.password = result_set[0]['password']

    return maker
  end

  def create(maker)
    sql = 'INSERT INTO makers (name, username, email, password) VALUES ($1, $2, $3, $4);'
    result_set = DatabaseConnection.exec_params(sql, [maker.name, maker.username, maker.email, maker.password])

    return maker
  end

  def find_with_username(username)
    maker_repo = MakerRepository.new
    all_makers = maker_repo.all

    unless all_makers.any?{|maker| maker.username == username}
      return 'Not found'
    else
      sql = 'SELECT id, name, username, email, password FROM makers WHERE username = $1;'
      result_set = DatabaseConnection.exec_params(sql, [username])

      maker = Maker.new
      maker.id = result_set[0]['id'].to_i
      maker.name = result_set[0]['name']
      maker.username = result_set[0]['username']
      maker.email = result_set[0]['email']
      maker.password = result_set[0]['password']

      return maker
    end
  end
end