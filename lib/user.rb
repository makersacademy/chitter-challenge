class User

  attr_reader :id

  def initialize(id:, name:, username:, password:, email_address:)
    @id = id
    @name = name
    @username = username
    @password = password
    @email_address = email_address
  end

  def self.create(name, username, password, email_address)
    password_hashed = BCrypt::Password.create(password)
    column_arr = ['name', 'username', 'email_address', 'password']
    values_arr = [name, username, email_address, password_hashed]
    results = DBConnection.insert(table: 'chitterer', columns: column_arr, values: values_arr).first
    User.new(id: results['id'].to_i, name: results['name'], username: results['username'], password: results['password'], email_address: results['email_address'])
  end

end
