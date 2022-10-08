require_relative 'maker'

class MakerRepository
  def all
    sql = 'SELECT id, name, username, email, password FROM makers'
    results_set = DatabaseConnection.exec_params(sql, [])

    makers = []

    results_set.each do |record|
      new_maker = Maker.new
      new_maker.id = record['id']
      new_maker.name = record['name']
      new_maker.username = record['username']
      new_maker.email = record['email']
      new_maker.password = record['password']

      makers << new_maker
    end

    return makers
  end

  def create(maker)
    sql = 'INSERT INTO makers (name, username, email, password) VALUES ($1, $2, $3, $4);'
    params = [maker.name, maker.username, maker.email, maker.password]

    DatabaseConnection.exec_params(sql, params)

    return nil
  end

  def find_username_by_id(id)
    sql = 'SELECT username FROM makers WHERE id = $1;'
    results_set = DatabaseConnection.exec_params(sql, [id])
   
    maker = Maker.new
    maker.username = results_set.first['username']
    
    return maker.username
  end

  def find_name_by_id(id)
    sql = 'SELECT name FROM makers WHERE id = $1;'
    results_set = DatabaseConnection.exec_params(sql, [id])
   
    maker = Maker.new
    maker.name = results_set.first['name']
    
    return maker.name
  end

  def maker_exists?(maker)
    result = false
    all.each do |existing_maker|
      result = true if maker.username == existing_maker.username || maker.email == existing_maker.email
    end

    return result
  end

  def password_match?(maker)
    result = false
    all.each do |existing_maker|
      result = true if maker.username == existing_maker.username && maker.password == existing_maker.password
    end

    return result
  end

end

