class User
  def self.create(email, password, connection = connect_to_database)
    connection.exec "INSERT INTO users(email, password) VALUES('#{email}', '#{password}')"
  end

  private

  def self.connect_to_database
    if ENV['RACK_ENV'] == 'test'
      PG.connect dbname: 'chitter_test'
    else
      PG.connect dbname: 'chitter'
    end
  end
end
