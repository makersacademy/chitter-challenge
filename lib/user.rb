# class User
#   attr_reader :id, :username, :name, :email, :password

#   def initialize(id, username, name, email, password)
#     @id = id
#     @username = username
#     @name = name
#     @email = email
#     @password = password
#   end

#   def self.all
#     result = DatabaseConnection.query("SELECT * FROM users")
#     result.map { |user| User.new(user['id'], user['username'], user['name'],
#                   user['email'], user['password']) 
#     }
#   end

#   def self.create(options)
#     result = DatabaseConnection.query("INSERT INTO users 
#         (username, name, email, password) 
#       VALUES('#{options[:username]}','#{options[:name]}','#{options[:email]}',
#         '#{options[:password]}') 
#       RETURNING id, username, name, email, password;")
#     User.new(result[0]['id'], result[0]['username'], result[0]['name'],
#              result[0]['email'], result[0]['password'])
#   end

#   def self.find(id)
#     return nil unless id
#     result = DatabaseConnection.query("SELECT * FROM users WHERE id = '#{id}'")
#     User.new(result[0]['id'], result[0]['username'], result[0]['name'],
#              result[0]['email'], result[0]['password'])
#   end
# end


# require 'bcrypt'
# class User
#   include DataMapper::Resource
#   attr_reader :password
#   attr_accessor :password_confirmation
#   validates_confirmation_of :password, message: 'Passwords don\'t match'
#   validates_uniqueness_of :email, message: 'Email is already registered...log in instead?'
#   validates_uniqueness_of :username, message: 'Username is taken'
#   validates_length_of :password, min: 8, message: 'Password needs a minimum of 8 characters'

#   property :id, Serial
#   property :username, String, unique: true, required: true
#   property :email, String, unique: true, required: true, format: :email_address
#   property :password_digest, Text
#   has n, :peeps, constraint: :destroy
#   has n, :comments, constraint: :destroy

#   def password=(password)
#     @password = password
#     self.password_digest = BCrypt::Password.create(password)
#   end

#   def self.authenticate(username, password)
#     user = first(username: username)
#     user if user && BCrypt::Password.new(user.password_digest) == password
#   end
# end
