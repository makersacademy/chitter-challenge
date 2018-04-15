module Database
  
  def setup_test
    @@database = PG.connect :dbname => 'chit_test', :user => 'danielwork'
  end

  def setup_regular
    @database = PG.connect :dbname => 'chitter', :user => 'danielwork'
  end

  def all_chits
    @database.exec "SELECT * FROM posts"
  end

  def all_users
    @database.exec "SELECT * FROM users"
  end

  def add_to_chits(chit)
    @database.exec_params('INSERT INTO posts (content, time) VALUES ($1, $2)', [chit.post, chit.time])
  end

  def add_to_users(user)
    @database.exec_params('INSERT INTO users (email, password, name, username) VALUES ($1, $2, $3, $4)', [user.email, user.password, user.name, user.username])
  end

  def search_for_user(username, password)
    @user = @database.exec_params("SELECT * FROM USERS WHERE username LIKE '#{username}' AND password like '#{password}'")
    !(@user.ntuples == 0)
  end
end


