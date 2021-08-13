class Account
  attr_reader :id, :name, :email

  def initialize(id = nil, name, email)
    @id = id
    @name = name
    @email = email
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM accounts;")
    result.map do |row| Account.new(row['id'], row['name'], row['email']) end
  end

  def self.sign_up(name, email)
    DatabaseConnection.query("INSERT INTO accounts (name, email) VALUES ('#{name}', '#{email}');")
  end

end