# require 'pg'

class Security

  def self.sign_up(username, password)
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test' )
    else
      connection = PG.connect(dbname: 'chitter')
    end
    connection.exec("INSERT INTO security VALUES('#{username}', '#{password}');")
  end


  def self.username

    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test' )
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM security")
    result.map {|security| "#{security['username']}"}
    
  end

  def self.password

    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test' )
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM security")
    result.map {|security| {:password => "#{security['password']}"}
    }
  end

end
