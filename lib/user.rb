require_relative 'db_manager'

class User

  attr_reader :name, :username, :email, :password, :id

  def initialize(name, username, email, password, id)
    @name = name
    @username = username
    @email = email
    @password = password
    @id = id
  end

  def self.create(name, username, email, password)
    result = DBManager.query("INSERT INTO users (name, username, email, password)
                            VALUES ('#{name}', '#{username}', '#{email}', '#{password}')
                            RETURNING id, name, username, email, password;"
                            )
    user_from_db_query(result[0])
  end

  def self.find(id)
    result = DBManager.query("SELECT * FROM users WHERE id = '#{id}'")
    user_from_db_query(result[0])
  end

  def self.sign_in(username, password)
    result = DBManager.query("SELECT * FROM users WHERE username = '#{username}'
                            AND password = '#{password}'"
                            )
    user_from_db_query(result[0])
  end

  private

  def self.user_from_db_query(q_result)
    User.new(q_result['name'], q_result['username'],
            q_result['email'], q_result['password'],
            q_result['id']
            )
  end
end
