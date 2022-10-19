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

  def username_exists(username)
    maker_repo = MakerRepository.new
    all_makers = maker_repo.all
    return all_makers.any?{|maker| maker.username == username}
  end

  def find_with_username(username)
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

  def log_in(username)
    sql = "UPDATE makers SET loggedin = true WHERE username = $1;"
    DatabaseConnection.exec_params(sql, [username])
  end

  def log_out(username)
    sql = "UPDATE makers SET loggedin = false WHERE username = $1;"
    DatabaseConnection.exec_params(sql, [username])
  end

  def loggedin(username)
    sql = 'SELECT loggedin FROM makers WHERE username = $1;'
    result_set = DatabaseConnection.exec_params(sql, [username])
    answer = result_set[0]['loggedin']
    return answer
  end
end