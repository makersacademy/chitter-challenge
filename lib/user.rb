require_relative './database_connection'

class User
  attr_reader :id, :email, :name, :username

  def self.create(email:, password:, name:, username:)
    user_record = (DatabaseConnection.query \
      "INSERT INTO users (email, password, name, username)" + \
      "VALUES('#{email}', '#{password}', '#{name}', '#{username}')" + \
      "RETURNING id, email, password, name, username").first

    to_user(user_record)
  end

  def self.find(id:)
  user_records = DatabaseConnection.query("SELECT * FROM users WHERE id = #{id}")
  user_records.ntuples == 0 \
    ? nil \
    : to_user(user_records.first)
  end

  def initialize(id:, email:, name:, username:)
    @id = id
    @email = email
    @name = name
    @username = username
  end

  def eql?(other_user)
    return false if other_user.nil?
    return false unless other_user.is_a?(User)

    @id == other_user.id \
    && @email = other_user.email \
    && @name = other_user.name \
    && @username = other_user.username
  end

  def ==(other_user)
    eql?(other_user)
  end

  def !=(other_user)
    !eql?(other_user)
  end

  private_class_method

  def self.to_user(user_record)
    User.new(
      id: user_record["id"], \
      email: user_record["email"], \
      name: user_record["name"], \
      username: user_record["username"]
    )
  end
end
