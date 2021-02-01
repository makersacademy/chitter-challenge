class User
  attr_reader :id, :email
  def initialize(id:, email:)
    @id = id
    @email = email
  end

  def self.create(email:, password:)
    return false unless is_email?(email)
    result = DatabaseConnection.exec("INSERT INTO users (email, password) VALUES ('#{email}', '#{password}') RETURNING id, email;")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.authenticate(email:, password:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE email = '#{email}'")
      return unless result.any?
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM users;")
    result.map do |user|
      User.new(id: user['id'],
               email: user['email'])
    end
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
    User.new(id: result[0]['id'], email: result[0]['email'])
  end

  private

  def self.is_email?(email)
    email =~ URI::MailTo::REGEXP
  end

end
