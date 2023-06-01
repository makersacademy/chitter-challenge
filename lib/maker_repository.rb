require_relative 'maker'

class MakerRepository
  def all
    makers = []
    
    sql = 'SELECT id, name, email, password FROM makers;'
    result_set = DatabaseConnection.exec_params(sql, [])
    
    result_set.each do |record|
      maker = Maker.new
      maker.id = record['id'].to_i
      maker.name = record['name']
      maker.email = record['email']
      maker.password = record['password']
    
      makers << maker
    end
    
    return makers
  end
end
