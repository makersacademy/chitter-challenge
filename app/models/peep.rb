
require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require_relative './user.rb'

class Peep

  include DataMapper::Resource

  property :id, Serial
  property :content, String
  # property :user_handle, String
  # property :name, String
  property :created_at, DateTime
  # property :user_id, Integer

  belongs_to :user
  

  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
  DataMapper.finalize
  DataMapper.auto_upgrade!
  # DataMapper::Model.raise_on_save_failure = true

end

# Username: <%= peep.user_id.username %>
#       Name: <%= peep.user_id.name %> 
#       Time: <%= peep.created_at %>
