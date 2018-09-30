require 'pg'

class User

  def self.store(email, password, first_name, last_name, username)
    self.connect_db
    @con.exec "INSERT INTO users (email, password, first_name, last_name, username) VALUES ('#{email}', '#{password}', '#{first_name}', '#{last_name}', '#{username}')"
  end

  def self.all
    self.connect_db
    result = @con.exec "SELECT users"
    result.map { |row| {:user => row['username'], :name => row['first_name']} }
  end

  private

  def self.connect_db
    database = ENV['ENVIRONMENT'] == 'test' ? 'peeps_manager_test' : 'peeps_manager'
    @con = PG.connect :dbname => database , :user => 'chloemingay'
  end


end
