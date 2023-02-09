require_relative 'maker'

class MakerRepository

  def all

    makers = []

    sql = 'SELECT id, email, password, name, username FROM makers;'
    result_set = DatabaseConnection.exec_params(sql,[])
    result_set.each do |record|
      maker = Maker.new
      maker.id = record['id'].to_i
      maker.email = record['email']
      maker.password = record['password']
      maker.name = record['name']
      maker.username = record['username']
      makers << maker
    end
    
    return makers
  end

  def create(maker)

    sql = 'INSERT INTO makers (email, password, name, username) VALUES ($1, $2, $3, $4);'
    params = [maker.email, maker.password, maker.name, maker.username]
    DatabaseConnection.exec_params(sql,params)
    return nil
  end

  def find(id)
    sql = 'SELECT id, email, password, name, username FROM makers WHERE id = $1;'
    params = [id]
    record = DatabaseConnection.exec_params(sql,params).first
    maker = Maker.new
    maker.id = record['id'].to_i
    maker.email = record['email']
    maker.password = record['password']
    maker.name = record['name']
    maker.username = record['username']
    return maker
  end

  def delete(id)
    sql = 'DELETE FROM makers WHERE id = $1;'
    params = [id]
    DatabaseConnection.exec_params(sql,params)
    return nil
  end

end
