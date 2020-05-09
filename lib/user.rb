require 'pg'

class User

  def self.sign_up(name:, email:, password:)
    connect_to_db.exec("INSERT INTO users (user_name, email, user_password) VALUES('#{name}', '#{email}', '#{password}');")
  end

  private

  def self.connect_to_db
    if ENV['ENVIRONMENT'] = 'test'
      PG.connect dbname: 'chitter_user_test'
    else
      PG.connect dbname: 'chitter_user'
    end
  end

end