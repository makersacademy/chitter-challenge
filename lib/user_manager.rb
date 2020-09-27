class UserManager
  def self.log_in(username, password)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end

    connection.exec("UPDATE users SET logged_in = true WHERE username = $1 AND password = crypt($2, password);", [username, password])
  end

  def self.logged_in?(username)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end

    result = connection.exec("SELECT logged_in FROM users WHERE username = $1 ;", [username])

    return false if result.values.length == 0

    return result.values[0][0]
  end

  def self.sign_up(user)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end

    connection.exec("INSERT INTO users (username, email, name, password, logged_in) VALUES ($1, $2, $3, crypt($4, gen_salt('bf') ), true);", [user.username, user.email, user.name, user.password])
  end
end
