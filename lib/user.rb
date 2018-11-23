require 'pg'

class User

  def self.find(username)
    ENV['ENV'] == 'test' ? database = 'chitter_test' : database = 'chitter'
    connection = PG.connect dbname: database

    result = connection.exec("SELECT id FROM users
                              WHERE username='#{username}';")
    result.first['id'].to_i
  end

end
