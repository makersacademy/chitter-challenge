require_relative 'maker'

class MakerRepository
  
  def all
    result = DatabaseConnection.exec_params('SELECT * FROM makers;', [])
    makers = []
    result.each do |row|
      maker = Maker.new
      maker.id = row['id'].to_i
      maker.name = row['name']
      maker.username = row['username']
      maker.email_address = row['email_address']
      maker.password = row['password']
      makers << maker
    end
    makers
  end

  def find(id)
    sql = 'SELECT * FROM makers WHERE id = $1;'
    result = DatabaseConnection.exec_params(sql, [id])
    maker = Maker.new 
    maker.id = result[0]['id'].to_i
    maker.name = result[0]['name']
    maker.username = result[0]['username']
    maker.email_address = result[0]['email_address']
    maker.password = result[0]['password']
    return maker
  end

  def create(maker_obj)
    sql = 'INSERT INTO makers(name, username, email_address, password) VALUES($1, $2, $3, $4);'
    params = [maker_obj.name, maker_obj.username, maker_obj.email_address, maker_obj.password]
    result = DatabaseConnection.exec_params(sql, params)
  end
end
