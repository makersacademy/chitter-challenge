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

class Comment < ActiveRecord::Base
  belongs_to :post

  validates :comment, presence: true
end