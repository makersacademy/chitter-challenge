require_relative './db_helper.rb'

class User
  def self.add(username, email)
    conn = DBHelper.connect_to_db
    # check if username or email is already on the db.
    if (conn.exec("SELECT username FROM users WHERE username iLIKE '#{username}'").first != nil ||
        conn.exec("SELECT email FROM users WHERE email iLIKE '#{email}'").first != nil)
      return 'fail'
    else
      conn.exec("INSERT INTO users(username, email) VALUES ('#{username}', '#{email}')")
      return 'success'
    end

  end
end