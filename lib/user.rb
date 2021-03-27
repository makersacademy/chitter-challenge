class User

  def self.new_user(username, password, email)
    new_user = DbConnection.query("INSERT INTO users(username, password, email) VALUES ('#{username}', '#{password}', '#{email}') 
                                   RETURNING user_id, username, email;")
    User.new(user_id: new_user[0]['user_id'], username: new_user[0]['username'], email: new_user[0]['email'])
  end

  attr_reader :user_id, :username, :email

  def initialize(user_id:, username:, email:)
    @user_id = user_id
    @username = username
    @email =  email
  end
end
