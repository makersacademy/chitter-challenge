require 'pg'

class Users
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'user_manager_test')
    else
      connection = PG.connect(dbname: 'user_manager')
    end
      
    result = connection.exec("SELECT * FROM users")
    result.map { |user| user['name'] }
  end
end