require_relative 'db_connection'
class User

  attr_reader :id

  def initialize(id:, name:, username:, password:, email_address:)
    @id = id
    @name = name
    @username = username
    @password = password
    @email_address = email_address
  end

  def self.create(name:, username:, password:, email_address:)
    return { duplicate_user: duplicate_user?(username), duplicate_email: duplicate_email?(email_address) } if duplicate_user?(username) || duplicate_email?(email_address)
    password_hashed = BCrypt::Password.create(password)
    column_arr = ['name', 'username', 'email_address', 'password']
    values_arr = [name, username, email_address, password_hashed]
    results = DBConnection.insert(table: 'chitterer', columns: column_arr, values: values_arr).first
    User.new(id: results['id'].to_i, name: results['name'], username: results['username'], password: results['password'], email_address: results['email_address'])
  end

  def self.find_name(id)
    return unless id
    results = DBConnection.query("select * from chitterer where id = #{id}").first
    return unless results
    results['name']
  end

  def self.duplicate_user?(user_name)
    DBConnection.select_safe(table: 'chitterer', column: 'username', value: user_name).any?
  end

  def self.duplicate_email?(email)
    DBConnection.select_safe(table: 'chitterer', column: 'email_address', value: email).any?
  end

end
