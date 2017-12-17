require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './user.rb'

# DataMapper.setup(:default,
# ENV['DATABASE_URL'] || "postgres://localhost/chitter_db_#{ENV['RACK_ENV']}")

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :date_created, String
  property :user_id, Integer

  belongs_to :user

end

# DataMapper.finalize
# DataMapper.auto_upgrade!
