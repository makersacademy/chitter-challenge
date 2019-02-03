require 'pg'

class User

  def self.all
    users = DatabaseConnection.query("SELECT * FROM users;")
    users.map{ |user| User.new(
      name: user['name'],
      email: user['email'],
      password: user['password'],
      id: user['id'])
    }
  end

  def self.add_new(name:, email:, password:)
    created = DatabaseConnection.query("INSERT INTO users(name, email, password)
    VALUES('#{name}', '#{email}', '#{password}')
    RETURNING name, email, password, id;")[0]
    user = User.new(
      name: created['name'],
      email: created['email'],
      password: created['password'],
      id: created['id'])
  end

  def self.find_by_name(name)
    users = DatabaseConnection.query("SELECT * FROM users WHERE name = #{'name'};")
    users.map{ |user| User.new(
      name: user['name'],
      email: user['email'],
      password: user['password'],
      id: user['id'])
    }
  end

    def self.find(id)
      return nil unless id
      result = DatabaseConnection.query("SELECT * FROM users
        WHERE id = #{'id'};")[0]
        User.new(
          name: result['name'],
          email: result['email'],
          password: result['password'],
          id: result['id'])
    end

    def self.find_or_create_anon_user
      anon = User.find_by_name("Anonymous")
      anon == [] ? anon << User.add_new(name: 'Anonymous', email: 'anon', password: 'anon'): anon.first
      return anon.first
    end


  attr_reader :name, :email, :password, :id

  def initialize(name:, email:, password:, id:)
    @name = name
    @email = email
    @password = password
    @id = id
  end

  private

  def create_user
  end

end
