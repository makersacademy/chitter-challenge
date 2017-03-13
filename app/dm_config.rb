require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require 'dm-validations'

<<<<<<< HEAD:app/dm_config.rb
require_relative 'models/peep.rb'
require_relative 'models/hashtag.rb'
require_relative 'models/user.rb'
=======

require_relative './peep.rb'
require_relative './hashtag.rb'
require_relative './user.rb'
>>>>>>> 030ed49... flash error messages added for incorrect user signup:app/models/dm_config.rb

def setup
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
  DataMapper.finalize
  DataMapper.auto_migrate!
end

setup
