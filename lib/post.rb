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

class Post < ActiveRecord::Base
  self.table_name = 'posts'
  self.primary_key = 'id'
  belongs_to :user

  has_many :comments, dependent: :destroy

  validates :peep, presence: true
end
