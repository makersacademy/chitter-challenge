class User
  attr_reader :id, :username
  
  def self.create(name:, username:, email:, password:)
    begin
      persisted = DatabaseConnection.query("INSERT INTO users(name, username, email, password) VALUES('#{name}', '#{username}', '#{email}', '#{password}') RETURNING id, username;").first
      new(id: persisted['id'], username: persisted['username'])
    
    rescue PG::UniqueViolation => e
      return :duplicate_username if e.message.include?('users_username_key')
      return :duplicate_email if e.message.include?('users_email_key')
      
      :error
    end    
  end

  private

  def initialize(id:, username:)
    @id = id
    @username = username
  end
end
