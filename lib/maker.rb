class Maker
  def self.add(name, username, email, password)
    sql = "INSERT INTO makers
      (name, username, email, password)
      VALUES
      ('#{name}', '#{username}', '#{email}', '#{password}');"
    DatabaseConnection.query(sql)
    @current_maker = username
  end

  def self.current
    @current_maker
  end
end
