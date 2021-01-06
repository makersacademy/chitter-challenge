class User

  @@current_username = "admin"
  @@current_user_id = 0


  def self.current_username
    @@current_username
  end
  def self.change_current_user_name(name)
    @@current_username = name
  end
  # def self.get_username(id)
  #   if ENV["Environment"] == 'test'
  #     con = PG.connect :dbname => 'chitter_test', :user => 'whelliwell1'
  #   else
  #     con = PG.connect :dbname => 'chitter', :user => 'whelliwell1'
  #   end
  #   rs = con.exec("SELECT username FROM users WHERE id='#{id}'")
  #   rs[0]["username"]
  # end

  def self.current_user_id
    @@current_user_id
  end
  def self.change_current_user_id(id)
    @@current_user_id = id
  end
  def self.get_user_id(name)
    if ENV["Environment"] == 'test'
      con = PG.connect :dbname => 'chitter_test', :user => 'whelliwell1'
    else
      con = PG.connect :dbname => 'chitter', :user => 'whelliwell1'
    end
    rs = con.exec("SELECT id FROM users WHERE username='#{name}'")
    rs[0]["id"]
  end


  def self.add(username)
      if ENV["Environment"] == 'test'
        con = PG.connect :dbname => 'chitter_test', :user => 'whelliwell1'
      else
        con = PG.connect :dbname => 'chitter', :user => 'whelliwell1'
      end

      con.exec("INSERT INTO users (username) VALUES ('#{username}') RETURNING id, username")
  end

  def self.exists?(username)
    begin
      if ENV["Environment"] == 'test'
        con = PG.connect :dbname => 'chitter_test', :user => 'whelliwell1'
      else
        con = PG.connect :dbname => 'chitter', :user => 'whelliwell1'
      end

      rs = con.exec "SELECT id FROM users WHERE username='#{username}'"
      if rs.to_a.length > 0
        return true
      else
        return false
      end

      rescue PG::Error => e

      puts e.message

      ensure

      con.close if con
    end
  end

end
