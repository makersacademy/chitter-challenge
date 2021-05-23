class User 
  def self.create(first_name, last_name, username, email, password)
    current_user = DatabaseConnection.query(
      "INSERT INTO users (first_name, last_name, username, email, password)
       VALUES('#{first_name}', '#{last_name}', '#{username}', '#{email}', '#{password}')
       RETURNING *"
      )
    @current = current_user.first
  end

  attr_accessor :current

  def self.current
    @current
  end
end