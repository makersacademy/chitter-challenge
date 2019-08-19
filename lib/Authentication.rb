require 'pg'

class Authentication

  def self.verify
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec('SELECT username,password FROM users').to_a
    result.include?($d.details)
  end

end
