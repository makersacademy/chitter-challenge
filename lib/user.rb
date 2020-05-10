require 'pg'

class User

  def self.sign_up(name:, email:, password:)
    connect_to_db.exec("INSERT INTO users (user_name, email, user_password) VALUES('#{name}', '#{email}', '#{password}');")
  end

  def self.log_in?(email:, password:)
    !!user_exist(email) && !!user_valid(email, password)
  end
  
  private
  
  def self.connect_to_db
    if ENV['ENVIRONMENT'] = 'test'
      PG.connect dbname: 'chitter_user_test'
    else
      PG.connect dbname: 'chitter_user'
    end
  end

  def self.user_exist(email)
    user = connect_to_db.exec("SELECT * FROM users WHERE email = '#{email}';")
    user.each do |user|
      return user['email'] == email
    end
  end
  
  def self.user_valid(email, password)
    user = connect_to_db.exec("SELECT * FROM users WHERE email = '#{email}';")
    user.each do |user|
      return user['email'] == email && user['user_password'] == password
    end

  end

end