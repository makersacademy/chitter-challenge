class User
  attr_reader :id, :firstname, :lastname, :email, :handle, :password

  def initialize(id, firstname, lastname, email, handle, password)
    @id = id
    @firstname = firstname
    @lastname = lastname
    @email = email
    @handle = handle
    @password = password
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map do |user| 
      User.new(
        user['id'],
        user['firstname'], 
        user['lastname'],
        user['email'],
        user['handle'],
        user['password']
      )
    end
  end

  def self.create(firstname:, lastname:, email:, handle:, password:)
    result = DatabaseConnection.query(
      "INSERT INTO users (firstname, lastname, email, handle, password) VALUES($1, $2, $3, $4, $5) RETURNING id, firstname, lastname, email, handle, password", 
      [firstname, lastname, email, handle, password]
    )
    User.new(result[0]['id'],
            result[0]['firstname'], 
            result[0]['lastname'], 
            result[0]['email'], 
            result[0]['handle'], 
            result[0]['password']
    )
  end

  def self.find(id:)
    return nil unless id
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1", [id])
    User.new(result[0]['id'],
      result[0]['firstname'], 
      result[0]['lastname'], 
      result[0]['email'], 
      result[0]['handle'], 
      result[0]['password']
    )  
end
end