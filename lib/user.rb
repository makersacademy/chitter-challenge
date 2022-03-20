require 'active_record'

if ENV['ENVIRONMENT'] == 'test'
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    username: ENV["USERNAME"],
    password: ENV["SQL_PASSWORD"],
    database: 'chitter_test'
  )
else 
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    username: ENV["USERNAME"],
    password: ENV["SQL_PASSWORD"],
    database: 'chitter'
  )
end

class User < ActiveRecord::Base
  self.table_name = 'users'
  self.primary_key = 'id'
  has_many :posts, dependent: :destroy
  has_secure_password

  validates :username, presence: true
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
end
