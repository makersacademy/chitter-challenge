class User

  attr_reader :email, :id, :handle 

  def initialize(id:, email:, handle:)
    @id = id
    @email = email
    @handle = handle
  end

  def self.create(email:, password:, handle:)
    result = DatabaseConnection.query("INSERT INTO users (email, password, handle) VALUES('#{email}', '#{password}', '#{handle}') RETURNING id, email, handle;")
    User.new(id: result[0]['id'], email: result[0]['email'], handle: result[0]['handle'])
  end
end
