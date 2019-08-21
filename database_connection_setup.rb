require 'data_mapper'
require './lib/models/message.rb'
require './lib/models/user.rb'

if ENV['ENVIRONMENT'] == 'test'
    DataMapper::setup(:default, "postgres://localhost/chitter_test")
    DataMapper.auto_upgrade!
else
    DataMapper::setup(:default, "postgres://localhost/chitter")
    DataMapper.auto_upgrade!
end