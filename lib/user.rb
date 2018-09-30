require_relative './db_helper.rb'

class User
  def self.add(username, email)
    conn = DBHelper.connect_to_db
    conn.exec("INSERT INTO users(username, email) VALUES ('#{username}', '#{email}')")
  end
end