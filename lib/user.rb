require 'pg'
require_relative './database_connection'

class User

  def self.create
    @user ||= User.new
  end

  def register(username:, email:, first_name:, last_name:, password:)
    begin
      DatabaseConnection.exec_prepared("insert_new_user", [username, email, first_name, last_name, password])
      return true
  rescue StandardError
    puts "An error happened while inserting a new user with USERNAME=#{username}"
    return false
    end
  end

  def sign_in(username:, password:)
    result = DatabaseConnection.exec_prepared('sign_in', [username, password])
    result.each do |row|
      count = row['count']

      if count != "1"
        return false
      else
        return true
      end
    end
end 
   

end
